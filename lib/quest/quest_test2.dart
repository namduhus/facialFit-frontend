import 'dart:convert';
import 'package:SmileHelper/main/mypage.dart';
import 'package:SmileHelper/shop/shop_main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:SmileHelper/Service/AuthService.dart';
import 'package:SmileHelper/main/main_stage.dart';
import 'package:SmileHelper/css/screen.dart'; // BaseScreen import
import 'dart:async';

class QuestTest2 extends StatefulWidget {
  const QuestTest2({super.key});

  @override
  QuestTest2State createState() => QuestTest2State();
}

class QuestTest2State extends State<QuestTest2> {
  int userCoins = 0; // 초기값 설정
  String userId = ''; // 로그인 ID 초기값
  final AuthService authService = AuthService(); // AuthService 인스턴스 생성
  List<dynamic> incompleteQuests = []; // 미완료 퀘스트 목록
  List<dynamic> completedQuests = []; // 완료 퀘스트 목록
  Map<int, bool> questCompleted = {}; // 퀘스트 완료 상태
  Map<int, bool> showContent = {}; // 퀘스트 내용 표시 상태
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _fetchUserId(); // 사용자 ID를 먼저 가져옴
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    return '${hours}h ${minutes}m';
  }

  void toggleQuestContent(int questId) {
    setState(() {
      showContent.forEach((key, value) {
        if (key != questId) {
          showContent[key] = false; // 다른 카드 내용은 숨김
        }
      });
      showContent[questId] = !(showContent[questId] ?? false); // 현재 카드 내용 토글
    });
  }

  Future<void> _fetchUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('userId');

    if (id != null && id.isNotEmpty) {
      setState(() {
        userId = id;
      });
      print('Fetched userId: $userId'); // 사용자 ID 로그 출력
      _fetchUserCoins();
      _fetchIncompleteQuests();
      _fetchCompletedQuests();
    } else {
      // 사용자 ID를 가져오지 못했을 때 처리
      print('Failed to fetch userId');
    }
  }

  Future<void> _fetchUserCoins() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');

    final url = Uri.parse('http://34.47.88.29:8082/api/user/coin');
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          userCoins = jsonResponse['coin'] ?? 0;
        });
      } else if (response.statusCode == 401) {
        await authService.refreshAccessToken();
        accessToken = prefs.getString('accessToken');
        final retryResponse = await http.get(
          url,
          headers: {'Authorization': 'Bearer $accessToken'},
        );

        if (retryResponse.statusCode == 200) {
          final jsonResponse = jsonDecode(retryResponse.body);
          setState(() {
            userCoins = jsonResponse['coin'] ?? 0;
          });
        } else {
          print('Failed to load user coins after token refresh: ${retryResponse
              .statusCode}');
          print('Response body: ${retryResponse.body}');
        }
      } else {
        print('Failed to load user coins: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error fetching user coins: $e');
    }
  }

  Future<void> _fetchIncompleteQuests() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');

    final url = Uri.parse(
        'http://34.47.88.29:8082/api/users/$userId/quests/incomplete');
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          incompleteQuests = jsonResponse;
        });
      } else {
        print('Failed to load incomplete quests: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error fetching incomplete quests: $e');
    }
  }

  // _fetchCompletedQuests 함수 수정
  Future<void> _fetchCompletedQuests() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');

    final url = Uri.parse(
        'http://34.47.88.29:8082/api/users/$userId/quests/completed');
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          completedQuests = jsonResponse;
          for (var quest in completedQuests) {
            if (quest['id'] != null) {
              questCompleted[quest['id']] = true;
            }
          }
        });
      } else {
        print('Failed to load completed quests: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error fetching completed quests: $e');
    }
  }

  Future<void> _completeQuest(int questId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');

    // 코인 증가 API 호출
    final coinUrl = Uri.parse('http://34.47.88.29:8082/api/user/increase-coin');
    try {
      final response = await http.post(
        coinUrl,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'userId': userId, 'amount': 3}),
      );

      if (response.statusCode == 200) {
        setState(() {
          userCoins += 3;
        });
        _showCompletionDialog();
      } else {
        print('Failed to increase coins: ${response.statusCode}');
        print('Response body: ${response.body}');
        return;
      }
    } catch (e) {
      print('Error increasing coins: $e');
      return;
    }

    // 퀘스트 완료 API 호출
    final questUrl = Uri.parse(
        'http://34.47.88.29:8082/api/users/$userId/quests/complete/$questId');
    try {
      final response = await http.post(
        questUrl,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          incompleteQuests.removeWhere((quest) => quest['id'] == questId);
          questCompleted[questId] = true;
          _fetchCompletedQuests(); // 완료된 퀘스트 목록을 다시 로드
        });
      } else {
        print('Failed to complete quest: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error completing quest: $e');
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations'),
          content: Text('Congratulations! You won 3 coins!!'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _navigateToShop() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ShopMain()),
    );
  }

  void _navigateToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainHome()),
    );
  }

  void _navigateToStatistics() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: Container(
          width: 424,
          height: 855,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/coin.png", // 코인 이미지 경로
                      width: 30,
                      height: 30,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '$userCoins', // 사용자 코인 소지량
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10), // 코인과 Quest 로고 사이 간격 조정
                Text(
                  'Quest',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30, // 폰트 크기 조정
                    fontWeight: FontWeight.w400,
                    height: 0.5,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      ...incompleteQuests.map((quest) =>
                          _buildQuestItem(quest, false)),
                      ...completedQuests.map((quest) =>
                          _buildQuestItem(quest, true)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: buildShimmerButton(
                          context,
                          'Shop',
                          _navigateToShop,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: buildShimmerButton(
                          context,
                          'Home',
                          _navigateToHome,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1.0),
                        child: buildShimmerButton(
                          context,
                          'MyPage',
                          _navigateToStatistics,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildShimmerButton(BuildContext context, String text,
      VoidCallback? onPressed) {
    return Container(
      height: 50, // 버튼 높이 설정
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFF8B4513), // 버튼 배경색을 흰색으로 설정
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // 버튼을 둥글게 설정
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // 패딩 조정
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildQuestItem(Map<String, dynamic> quest, bool isCompleted) {
    bool canComplete = false;

    int questId = quest['quest_id'] ?? 0; // 기본값 0 설정
    String? nextAvailableTimeStr = quest['next_available_time'];
    DateTime? nextAvailableTime = nextAvailableTimeStr != null ? DateTime.parse(nextAvailableTimeStr) : null;
    Duration? timeRemaining = nextAvailableTime != null ? nextAvailableTime.difference(DateTime.now()) : null;

    if (questId == 1 && userCoins >= 10) {
      canComplete = true;
    } else if (questId == 2 && questCompleted[1] == true) {
      canComplete = true;
    } else if (questId == 3 && questCompleted[3] == true) {
      canComplete = true;
    } else if (questId == 4 && questCompleted[3] == true) {
      canComplete = true;
    }

    Color getTypeColor(String type) {
      switch (type) {
        case 'DAILY':
          return Colors.black;
        case 'BIWEEKLY':
          return Colors.black;
        case 'ONE_TIME':
          return Colors.black;
        default:
          return Colors.black;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () => toggleQuestContent(questId),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: isCompleted ? Colors.grey : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quest['type'],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: getTypeColor(quest['type']),
                ),
              ),
              SizedBox(height: 8),
              Text(
                quest['title'] ?? '',
                style: TextStyle(
                  fontSize: 16, // 폰트 크기 조정
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              if (!isCompleted && timeRemaining != null && timeRemaining.isNegative == false)
                SizedBox(height: 8),
              if (!isCompleted && timeRemaining != null && timeRemaining.isNegative == false)
                Text(
                  _formatDuration(timeRemaining),
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                  ),
                ),
              if (showContent[questId] ?? false) ...[
                SizedBox(height: 8),
                Text(
                  quest['content'] ?? '',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
              ],
              buildShimmerButton(
                context,
                isCompleted ? 'Quest Finished' : 'Start Quest',
                isCompleted || !canComplete ? null : () => _completeQuest(questId),
              ),
            ],
          ),
        ),
      ),
    );
  }
}