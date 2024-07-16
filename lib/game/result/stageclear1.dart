import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class StageClear extends StatefulWidget {
  @override
  _StageClearState createState() => _StageClearState();
}

class _StageClearState extends State<StageClear> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playSound();
  }

  Future<void> _playSound() async {
    // 사운드 재생
    await _audioPlayer.play(AssetSource('clear.mp3'), volume: 15.0);
    // 2초 후에 사운드 정지
    Future.delayed(Duration(seconds: 2), () {
      _audioPlayer.stop();
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF207F66),
      appBar: AppBar(
        automaticallyImplyLeading: false, // 뒤로 가기 버튼 없애기
        title: Image.asset(
          'assets/images/Logo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFF207F66),
              ),
              child: Text(
                '1 Stage!!!',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFFAF9E0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/Congratulation!.png',
                    fit: BoxFit.contain,
                    width: 350, // 원하는 너비로 조절
                    height: 150, // 이미지의 높이 조절
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/clapping.png',
                    fit: BoxFit.contain,
                    width: 500, // 이미지의 너비 조절
                    height: 200, // 이미지의 높이 조절
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
