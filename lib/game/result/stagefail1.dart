import 'package:SmileHelper/main/main_stage.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:SmileHelper/game/story/story_stage.dart'; // StoryStage import
import 'package:get/get.dart'; // Get 패키지 import
import 'package:shimmer/shimmer.dart';

class StageFail extends StatefulWidget {
  @override
  _StageFailState createState() => _StageFailState();
}

class _StageFailState extends State<StageFail> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playSound();
  }

  Future<void> _playSound() async {
    // 사운드 재생
    await _audioPlayer.play(AssetSource('fail.mp3'), volume: 15.0);
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

  Widget buildShimmerButton(BuildContext context, String text, Widget page) {
    return Container(
      height: 50, // 버튼 높이 설정
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Color(0xFF8B4513), // 버튼 배경색을 흰색으로 설정
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // 버튼을 둥글게 설정
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // 패딩 조정
        ),
        onPressed: () {
          Get.to(page);
        },
        child: Shimmer.fromColors(
          baseColor: Colors.black,
          highlightColor: Color(0xFFD2691E),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8B4513),
      appBar: AppBar(
        automaticallyImplyLeading: false, // 뒤로 가기 버튼 없애기
        title: Image.asset(
          'assets/images/Logo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF8B4513),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFF8B4513),
              ),
              child: Text(
                '1 Stage...',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/Game Over.png',
                    fit: BoxFit.contain,
                    width: 350, // 원하는 너비로 조절
                    height: 150, // 이미지의 높이 조절
                  ),
                  SizedBox(height: 15),
                  Image.asset(
                    'assets/images/sad.png',
                    fit: BoxFit.contain,
                    width: 500, // 이미지의 너비 조절
                    height: 150, // 이미지의 높이 조절
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // 가로로 중앙 정렬
              children: [
                buildShimmerButton(context, 'Stage', StoryStage()),
                SizedBox(width: 20), // 간격 추가
                buildShimmerButton(context, 'Home', MainHome()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
