import 'dart:convert';
import 'package:SmileHelper/main/mypage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:SmileHelper/shop/shop_main.dart';
import 'package:SmileHelper/quest/quest_test2.dart'; // QuestTest2 import
import 'package:audioplayers/audioplayers.dart';
import '../Service/AudioService.dart';
import '../calendar/calendar.dart';

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

  @override
  void initState() {
    super.initState();
    _fetchNickname();
    _fetchUserCoins();
    _playBackgroundMusic();
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

    final response = await http.get(
      Uri.parse('http://34.47.88.29:8082/api/user/all'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      setState(() {
        nickname = jsonResponse['nickname'];
      });
    } else {
      print('Failed to load nickname: ${response.statusCode}');
    }
  }

  Future<void> _fetchUserCoins() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');

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
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Implement your Story Mode functionality here
                  },
                  child: Text('Story Mode', style: TextStyle(color: Colors.black)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFAF9E0),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Implement your Bonus Mode functionality here
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
        title: Image.asset(
          'assets/images/Logo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
        centerTitle: true,
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
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ShopMain()),
                                  );
                                },
                                child: Text('Shop'),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MainHome()),
                                  );
                                },
                                child: Text('Home'),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MyPage()),
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
                              MaterialPageRoute(builder: (context) => QuestTest2()),
                            );
                          },
                        ),
                        // calendar 버튼의 onPressed 함수 수정
                        IconButton(
                          icon: Image.asset('assets/images/calendar.png'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CalendarPage()),
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
                    child: IconButton(
                      icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up),
                      onPressed: _toggleMute,
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
