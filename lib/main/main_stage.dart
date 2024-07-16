import 'dart:convert';
import 'dart:io';
import 'package:SmileHelper/main/mypage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:SmileHelper/shop/shop_main.dart';
import 'package:SmileHelper/quest/quest_test2.dart'; // QuestTest2 import
import 'package:audioplayers/audioplayers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../calendar/calendar.dart';
import '../Service/AudioService.dart';
import 'package:SmileHelper/game/story/prolog.dart'; // Prolog import
import 'package:SmileHelper/game/bonus/start.dart'; // BonusStartPage import
import 'package:SmileHelper/game/bonus/bonus_game.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  double _opacity = 1.0;
  String nickname = '';
  int userCoins = 0;
  late AudioPlayer _audioPlayer;
  double _volume = 0.5; // Initial volume
  bool isMuted = false;
  final AudioService _audioService = AudioService();
  File? _imageFile; // 이미지 파일을 한 장만 저장
  String? userId;

  @override
  void initState() {
    super.initState();
    _fetchNickname();
    _fetchUserCoins();
    _playBackgroundMusic();
    _loadImage();
    _checkFirstPhoto();
  }

  Future<void> _playBackgroundMusic() async {
    await _audioService.playBackgroundMusic();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _fetchNickname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');

    if (accessToken != null) {
      final response = await http.get(
        Uri.parse('http://34.47.88.29:8082/api/user/all'),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          nickname = jsonResponse['nickname'];
          userId = jsonResponse['userId'];
          _saveUserId(userId!); // 사용자 ID를 SharedPreferences에 저장
        });
      } else {
        print('Failed to load nickname: ${response.statusCode}');
      }
    }
  }

  Future<void> _fetchUserCoins() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');

    if (accessToken != null) {
      final response = await http.get(
        Uri.parse('http://34.47.88.29:8082/api/user/coin'),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          userCoins = jsonResponse['coin'] ?? 0;
        });
      } else {
        print('Failed to load user coins: ${response.statusCode}');
      }
    }
  }

  Future<void> _checkFirstPhoto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');

    if (userId != null) {
      final response = await http.post(
        Uri.parse('http://34.47.88.29:8082/api/user/first-photo'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'userid': userId}),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        bool hasTakenFirstPhoto = jsonResponse['firstPhoto'] ?? true;

        if (hasTakenFirstPhoto) {
          _showPhotoDialog();
        }
      } else {
        print('Failed to check first photo status: ${response.statusCode}');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('사용자 ID를 찾을 수 없습니다. 다시 로그인해 주세요.')),
      );
    }
  }

  Future<void> _takePicture() async {
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('사용자 ID를 찾을 수 없습니다. 다시 로그인해 주세요.')),
      );
      return;
    }

    // 권한 요청
    if (await Permission.camera.request().isGranted &&
        await Permission.storage.request().isGranted) {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        // 특정 디렉토리 설정
        final Directory? externalDir = await getExternalStorageDirectory();
        final String dirPath = '${externalDir!.path}/MyAppImages';
        await Directory(dirPath).create(recursive: true);

        String filePath;
        int counter = 1;
        do {
          filePath = '$dirPath/$userId${counter == 1 ? '' : '_$counter'}.jpg';
          counter++;
        } while (await File(filePath).exists());

        File(image.path).copy(filePath).then((file) async {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('사진이 저장되었습니다: $filePath')),
          );
          // API 호출
          await _uploadPhoto(userId!, filePath);
          setState(() {
            _imageFile = file; // 이미지 파일 갱신
          });
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('카메라 또는 저장소 권한이 필요합니다.')),
      );
    }
  }

  Future<void> _uploadPhoto(String userId, String filePath) async {
    // API 호출 예제
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://34.47.88.29:8082/api/user/first-photo'),
    );
    request.fields['userid'] = userId; // userId 추가
    request.files.add(await http.MultipartFile.fromPath('photo', filePath));
    var response = await request.send();

    if (response.statusCode == 200) {
      print('사진이 성공적으로 업로드되었습니다.');
      // 첫 번째 사진 찍었다는 것을 false로 설정
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('hasTakenFirstPhoto', false);
    } else {
      print('사진 업로드에 실패했습니다.');
    }
  }

  Future<void> _loadImage() async {
    final Directory? externalDir = await getExternalStorageDirectory();
    final String dirPath = '${externalDir!.path}/MyAppImages';
    final directory = Directory(dirPath);

    if (userId != null) {
      int counter = 1;
      File? imageFile;
      while (true) {
        final filePath =
            '$dirPath/$userId${counter == 1 ? '' : '_$counter'}.jpg';
        final file = File(filePath);
        if (await file.exists()) {
          imageFile = file;
        } else {
          break;
        }
        counter++;
      }

      setState(() {
        _imageFile = imageFile;
      });

      if (_imageFile == null) {
        _showPhotoDialog();
      }
    }
  }

  Future<void> _saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  void _showPhotoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('사진을 찍어주세요'),
          content: Text('첫 이용자는 사진을 찍어주세요.'),
          actions: <Widget>[
            TextButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('사진 찍기'),
              onPressed: () {
                Navigator.of(context).pop();
                _takePicture();
              },
            ),
          ],
        );
      },
    );
  }

  void _showModeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Mode'),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFAF9E0),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await _audioService.stopBackgroundMusic(); // 배경음악 멈추기
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Prolog()),
                    );
                  },
                  child:
                      Text('Story Mode', style: TextStyle(color: Colors.black)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFAF9E0),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BonusGame()));
                  },
                  child: Text('Bonus Mode', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _toggleMute() {
    setState(() {
      if (isMuted) {
        _audioService.setVolume(_volume); // Unmute
      } else {
        _audioService.setVolume(0.0); // Mute
      }
      isMuted = !isMuted;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 뒤로 가기 버튼 없애기
        title: Image.asset(
          'assets/images/Logo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
        centerTitle: true,
        actions: [
          if (_imageFile != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(
                _imageFile!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: screenHeight * 0.71,
                    child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.29,
                      decoration: BoxDecoration(color: Color(0xFF48AA7B)),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.71,
                      decoration: BoxDecoration(color: Color(0xFFFAF9E0)),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.6,
                    top: screenHeight * 0.50,
                    child: Container(
                      width: screenWidth * 0.5,
                      height: screenHeight * 0.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/refrigerator.png"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * -0.05,
                    top: screenHeight * 0.5,
                    child: Container(
                      width: screenWidth * 0.5,
                      height: screenHeight * 0.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/desk.png"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.35,
                    top: screenHeight * 0.001,
                    child: Container(
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/light.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Opacity(opacity: _opacity),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.35,
                    top: screenHeight * 0.49,
                    child: GestureDetector(
                      onTap: _showModeDialog,
                      child: Container(
                        width: screenWidth * 0.3,
                        height: screenHeight * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/main.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  Positioned(
                    left: 0,
                    top: screenHeight * 0.83,
                    child: Container(
                      width: screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShopMain()),
                                  );
                                },
                                child: Text('Shop'),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainHome()),
                                  );
                                },
                                child: Text('Home'),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyPage()),
                                  );
                                },
                                child: Text('MyPage'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.001,
                    top: screenHeight * 0.01,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/coin.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '$userCoins',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.18,
                    top: screenHeight * 0.43,
                    child: Container(
                      width: screenWidth * 0.25,
                      height: screenHeight * 0.15,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Topic.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Hello! $nickname sir!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.5,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: screenWidth * 0.001,
                    top: screenHeight * 0.01, // AppBar 바로 아래
                    child: Row(
                      children: [
                        IconButton(
                          icon: Image.asset('assets/images/Parchment.png'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuestTest2()),
                            );
                          },
                        ),
                        // calendar 버튼의 onPressed 함수 수정
                        IconButton(
                          icon: Image.asset('assets/images/calendar.png'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CalendarPage()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Image.asset('assets/images/setting.png'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: screenWidth * 0.001,
                    top: screenHeight * 0.09,
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(
                              isMuted ? Icons.volume_off : Icons.volume_up),
                          onPressed: _toggleMute,
                        ),
                        IconButton(
                          icon: Icon(Icons.camera_alt),
                          onPressed: _takePicture,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MainHome(),
  ));
}
