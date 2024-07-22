import 'dart:convert';
import 'dart:io';
import 'package:SmileHelper/main/mypage.dart';
import 'package:SmileHelper/main/setting.dart';
import 'package:flutter/material.dart';
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
import 'package:SmileHelper/game/bonus/bonus_game.dart';
import 'package:SmileHelper/Service/MlkitService.dart';
import 'package:SmileHelper/game/mlkit/file_utils.dart'; // 좌표 저장 함수가 있는 파일
import 'package:SmileHelper/css/screen_home.dart'; // BaseScreen 파일 import
import 'second_page.dart'; // second_page.dart import

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
        SnackBar(content: Text('User ID not found. Please log in again.')),
      );
    }
  }

  Future<void> _takePicture() async {
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User ID not found. Please log in again.')),
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
            SnackBar(content: Text('The photo has been saved.: $filePath')),
          );
          // API 호출
          await _uploadPhoto(userId!, filePath);
          setState(() {
            _imageFile = file; // 이미지 파일 갱신
          });
          // 랜드마크 디렉토리 설정
          final String newDirPath = '${externalDir!.path}/MyAppImages/Landmarks';
          await Directory(newDirPath).create(recursive: true);
          await _processAndSaveLandmarks(file, newDirPath); // 추가된 코드: newDirPath 전달
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Camera or storage permission is required.')),
      );
    }
  }

  Future<void> _uploadPhoto(String userId, String filePath) async {
    // Example of an API call
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://34.47.88.29:8082/api/user/first-photo'),
    );
    request.fields['userid'] = userId; // Add userId
    request.files.add(await http.MultipartFile.fromPath('photo', filePath));
    var response = await request.send();

    if (response.statusCode == 200) {
      print('Photo uploaded successfully.');
      // Set that the first photo has been taken to false
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('hasTakenFirstPhoto', false);
    } else {
      print('Failed to upload photo.');
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

  Future _saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  void _showPhotoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Take a Photo',
            style: TextStyle(
              fontSize: 24, // 제목 폰트 사이즈
              fontWeight: FontWeight.bold, // 제목 폰트 굵기
            ),
          ),
          content: Text(
            'As a first-time user, please take a photo.',
            style: TextStyle(
              fontSize: 16, // 내용 폰트 사이즈
              fontWeight: FontWeight.normal, // 내용 폰트 굵기
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 16, // 버튼 폰트 사이즈
                  fontWeight: FontWeight.normal, // 버튼 폰트 굵기
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Take Photo',
                style: TextStyle(
                  fontSize: 16, // 버튼 폰트 사이즈
                  fontWeight: FontWeight.bold, // 버튼 폰트 굵기
                ),
              ),
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
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8B4513),
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
                  Text('Story Mode', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8B4513),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BonusGame()));
                  },
                  child: Text('Bonus Mode', style: TextStyle(color: Colors.white)),
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

  Future<void> _processAndSaveLandmarks(File imageFile, String dirPath) async {
    final faceData = await detectFaceLandmarks(imageFile);
    if (faceData.isNotEmpty) {
      final fileName = imageFile.path.split('/').last.split('.').first;
      final landmarksFilePath = '$dirPath/$userId.txt'; // 사용자 ID를 파일 이름으로 사용
      await saveLandmarksToFile(faceData, landmarksFilePath);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Landmark and contour coordinates have been saved: $landmarksFilePath')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to recognize a face.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BaseScreen_home(
      imageFile: _imageFile,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/test.png'), // 배경 이미지 경로 설정
                  fit: BoxFit.cover, // 이미지가 화면에 맞게 조정되도록 설정
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: screenHeight * 0.71,
                    child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.29,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.71,
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.38,
                    top: screenHeight * 0.30,
                    child: GestureDetector(
                      onTap: _showModeDialog,
                      child: Container(
                        width: screenWidth * 0.6,
                        height: screenHeight * 0.6,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/main_character.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.5),
                  Positioned(
                    left: 0,
                    top: screenHeight * 0.8,
                    child: Container(
                      width: screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildShimmerButton(
                            context,
                            'Shop',
                            ShopMain(),
                          ),
                          buildShimmerButton(
                            context,
                            'Home',
                            MainHome(),
                          ),
                          buildShimmerButton(
                            context,
                            'MyPage',
                            MyPage(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.06,
                    top: screenHeight * 0.02,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/coin.png',
                          width: 45,
                          height: 45,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '$userCoins',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.16,
                    top: screenHeight * 0.25,
                    child: Container(
                      width: screenWidth * 0.5,
                      height: screenHeight * 0.23,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/speech_bubble.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0), // 좌측, 상단, 우측, 하단 패딩 설정
                        child: Text(
                          'Good day, $nickname!\nKeep it up!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
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
                          icon: Container(
                            width: 45.0,  // 원하는 너비로 설정
                            height: 45.0, // 원하는 높이로 설정
                            child: Image.asset('assets/images/Quest2.png'),
                          ),
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
                          icon: Container(
                            width: 45.0,  // 원하는 너비로 설정
                            height: 45.0, // 원하는 높이로 설정
                            child: Image.asset('assets/images/calendar.png'),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CalendarPage()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Container(
                            width: 45.0,  // 원하는 너비로 설정
                            height: 45.0, // 원하는 높이로 설정
                            child: Image.asset('assets/images/setting2.png'),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Setting()),
                            );
                          },
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
                        IconButton(
                          icon: Icon(Icons.photo),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SecondPage(),
                              ),
                            );
                          },
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

  Widget buildShimmerButton(BuildContext context, String text, Widget page) {
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
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
}

void main() {
  runApp(MaterialApp(
    home: MainHome(),
  ));
}
