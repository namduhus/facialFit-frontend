import 'dart:convert';
import 'package:SmileHelper/main/mypage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:SmileHelper/Service/AuthService.dart';
import 'package:SmileHelper/main/main_stage.dart';
import 'package:SmileHelper/css/screen.dart'; // BaseScreen import

class ShopMain extends StatefulWidget {
  const ShopMain({super.key});

  @override
  ShopState createState() => ShopState();
}

class ShopState extends State<ShopMain> {
  List<bool> selectedItems = List.generate(9, (index) => false);
  List<int> itemQuantities = List.generate(9, (index) => 0); // 각 아이템의 수량
  List<String> itemImages = List.generate(9, (index) => ''); // 각 아이템의 이미지 경로
  List<String> itemPriceImages = List.generate(9, (index) => ''); // 각 아이템의 가격 이미지 경로
  int userCoins = 0; // 초기값 설정
  String userId = ''; // 로그인 ID 초기값
  final AuthService authService = AuthService(); // AuthService 인스턴스 생성
  bool isLoading = true; // 로딩 상태를 나타내는 변수

  // API에서 사용자 코인 값을 가져오는 함수
  Future<void> _fetchUserCoins() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    userId = prefs.getString('userId') ?? ''; // 사용자 ID 가져오기
    print('Fetched userId: $userId');

    final url = Uri.parse('http://34.47.88.29:8082/api/user/coin');
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (response.statusCode == 200) {
        // API 호출 성공
        final jsonResponse = jsonDecode(response.body);
        // 'coin' 필드가 있는지 확인하고, 있으면 해당 값을 사용하고 없으면 기본값 0으로 처리
        setState(() {
          userCoins = jsonResponse['coin'] ?? 0;
        });
      } else if (response.statusCode == 401) {
        // Access token이 만료된 경우, refresh token을 사용하여 갱신
        await authService.refreshAccessToken();
        accessToken = prefs.getString('accessToken');

        // 갱신된 토큰을 사용하여 다시 요청
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
          print('Failed to load user coins after token refresh: ${retryResponse.statusCode}');
          print('Response body: ${retryResponse.body}');
        }
      } else {
        // API 호출 실패
        print('Failed to load user coins: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // 예외 처리
      print('Error fetching user coins: $e');
    }
  }

  // API에서 사용자별 아이템 수량을 가져오는 함수
  Future<void> _fetchItemQuantities() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    userId = prefs.getString('userId') ?? ''; // 사용자 ID 가져오기

    final url = Uri.parse('http://34.47.88.29:8082/api/items/user/$userId');
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (response.statusCode == 200) {
        // API 호출 성공
        final jsonResponse = jsonDecode(response.body) as List;
        setState(() {
          for (int i = 0; i < jsonResponse.length; i++) {
            itemQuantities[i] = jsonResponse[i]['quantity'] ?? 0;
            itemImages[i] = jsonResponse[i]['quantity'] > 0
                ? "assets/images/${i + 1}.png"
                : "assets/images/Soldout.png";
            itemPriceImages[i] = "assets/images/price${(i ~/ 3) + 1}.png";
          }
          isLoading = false; // 데이터 로드가 완료되면 로딩 상태 해제
        });
      } else {
        print('Failed to load item quantities: ${response.statusCode}');
        print('Response body: ${response.body}');
        setState(() {
          isLoading = false; // 에러가 발생해도 로딩 상태 해제
        });
      }
    } catch (e) {
      // 예외 처리
      print('Error fetching item quantities: $e');
      setState(() {
        isLoading = false; // 예외가 발생해도 로딩 상태 해제
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // 페이지가 로드될 때 사용자 코인 값과 아이템 수량을 가져오도록 초기화 메서드에서 호출
    _fetchUserCoins();
    _fetchItemQuantities();
  }

  Future<void> _purchaseItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');

    List<int> purchasedItems = [];
    for (int i = 0; i < selectedItems.length; i++) {
      if (selectedItems[i]) {
        purchasedItems.add(i + 1);
      }
    }

    if (purchasedItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No items selected for purchase.')),
      );
      return;
    }

    if (userId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User ID is missing. Please log in again.')),
      );
      return;
    }

    // 아이템 ID 리스트를 콤마로 구분된 문자열로 변환
    String itemIds = purchasedItems.join(',');

    // URL 쿼리 매개변수로 전달
    final url = Uri.parse(
        'http://34.47.88.29:8082/api/purchase/purchase?id=$userId&itemId=$itemIds');
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json'
        },
      );

      if (response.statusCode == 200) {
        // Purchase successful
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          userCoins = jsonResponse['remainingCoins'] ?? userCoins;
          selectedItems = List.generate(9, (index) => false); // Clear selected items
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Purchased items: ${purchasedItems.join(', ')}')),
        );
        // 구매 후 코인과 아이템 수량을 다시 가져옴
        await _fetchUserCoins();
        await _fetchItemQuantities();
      } else {
        // 서버 응답 본문에 있는 에러 메시지 출력
        final errorResponse = jsonDecode(response.body);
        print('Failed to purchase items: ${response.statusCode} - ${errorResponse['message']}');
        print('Response body: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to purchase items: ${errorResponse['message']}')),
        );
      }
    } catch (e) {
      // Exception handling
      print('Error purchasing items: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error purchasing items. Please try again.')),
      );
    }
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
            padding: const EdgeInsets.all(0.9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center, // 수정된 부분
                  children: [
                    Container(
                      // 추가된 부분
                      margin: EdgeInsets.only(bottom: 10), // 원하는 만큼의 마진 추가
                      child: Image.asset(
                        "assets/images/coin.png", // 코인 이미지 경로
                        width: 30,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 0),
                    Container(
                      // 추가된 부분
                      margin: EdgeInsets.only(bottom: 8), // 원하는 만큼의 마진 추가
                      child: Text(
                        '$userCoins', // 사용자 코인 소지량
                        style: TextStyle(
                          color: Color(0xFFFFF3F3),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 70),
                    // 코인과 Shop 로고 사이 간격 조정
                    Text(
                      'Shop',
                      style: TextStyle(
                        color: Color(0xFFFFF3F3),
                        fontSize: 51.53,
                        fontFamily: 'ABeeZee',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                SizedBox(
                  height: 0.3,
                ),
                Expanded(
                  child: isLoading // 로딩 상태에 따라 다른 위젯을 표시
                      ? Center(child: CircularProgressIndicator()) // 로딩 중일 때 로딩 인디케이터
                      : GridView.builder(
                    padding: const EdgeInsets.all(40),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 3 items per row
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return ShopItem(
                        imagePath: itemImages[index],
                        itemName: 'Item ${index + 1}',
                        itemPriceImage: itemPriceImages[index],
                        isSelected: selectedItems[index],
                        onTap: itemQuantities[index] > 0
                            ? () {
                          setState(() {
                            selectedItems[index] = !selectedItems[index];
                          });
                        }
                            : null, // 수량이 0인 경우 선택 불가능
                      );
                    },
                  ),
                ),
                SizedBox(height: 5),
                ElevatedButton(
                  onPressed: _purchaseItems,
                  child: Text('Purchase'),
                ),
                SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Shop'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ElevatedButton(
                          onPressed: _navigateToHome,
                          child: Text('Home'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ElevatedButton(
                          onPressed: _navigateToStatistics,
                          child: Text('MyPage'),
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
}

class ShopItem extends StatelessWidget {
  final String imagePath;
  final String itemName;
  final String itemPriceImage;
  final bool isSelected;
  final VoidCallback? onTap;

  const ShopItem({
    super.key,
    required this.imagePath,
    required this.itemName,
    required this.itemPriceImage,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF87CEEB) : Colors.transparent,
          // 아이템 선택 시 강조 색상
          shape: BoxShape.rectangle,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
            SizedBox(height: 10),
            Text(
              itemName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black, // 텍스트 색상 설정
              ),
            ),
            SizedBox(height: 5),
            Image.asset(
              itemPriceImage,
              width: 50,
              height: 20,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
