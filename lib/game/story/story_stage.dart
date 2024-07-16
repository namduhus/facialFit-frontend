import 'package:flutter/material.dart';
import 'package:SmileHelper/main/main_stage.dart'; // MainHome import
import 'package:SmileHelper/game/story/start.dart'; // StartPage import

class StoryStage extends StatefulWidget {
  @override
  _StoryStageState createState() => _StoryStageState();
}

class _StoryStageState extends State<StoryStage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 뒤로 가기 버튼 없애기
        leading: IconButton(
          icon: Image.asset('assets/images/home.png'), // 집 모양 이미지 경로
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainHome()),
            );
          },
        ),
        title: Image.asset(
          'assets/images/Logo.png', // 로고 이미지 경로
          fit: BoxFit.contain,
          height: 32,
        ),
        centerTitle: true,
        backgroundColor: Colors.white, // AppBar 배경색 흰색으로 설정
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Color(0xFF207F66), // 배경색 설정
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.71,
                color: Color(0xFFFAF9E0), // 배경색 설정
              ),
            ),
            Positioned(
              left: 0,
              top: screenHeight * 0.71,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.192,
                color: Color(0xFF48AA7B), // 바닥색 설정
                child: Center(
                  child: Image.asset(
                    'assets/images/weding.png', // 중앙 이미지 경로
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: screenWidth * 0.2, // 원하는 너비 설정
                child: ListView.builder(
                  itemCount: 10, // 충분한 이미지 수 설정
                  itemBuilder: (context, index) {
                    return Image.asset(
                      'assets/images/forest.png',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: screenWidth * 0.2, // 원하는 너비 설정
                child: ListView.builder(
                  itemCount: 10, // 충분한 이미지 수 설정
                  itemBuilder: (context, index) {
                    return Image.asset(
                      'assets/images/forest.png',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.25,
              top: screenHeight * 0.1,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StoryStart()),
                  );
                },
                child: Text('Stage 1'),
              ),
            ),
            Positioned(
              right: screenWidth * 0.25,
              top: screenHeight * 0.22,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Stage 2'),
              ),
            ),
            Positioned(
              left: screenWidth * 0.25,
              top: screenHeight * 0.33,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Stage 3'),
              ),
            ),
            Positioned(
              right: screenWidth * 0.25,
              top: screenHeight * 0.43,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Stage 4'),
              ),
            ),
            Positioned(
              left: screenWidth * 0.25,
              top: screenHeight * 0.53,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Stage 5'),
              ),
            ),
            Positioned(
              top: screenHeight * 0.65,
              left: screenWidth * 0.5 - 50, // 중앙 정렬
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Stage 6'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
