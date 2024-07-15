//// Story 모드 start 버튼

import 'package:flutter/material.dart';

class StoryStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/Logo.png', // 로고 이미지 경로
          height: 30, // 이미지 높이 조정
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFF207F66),
          height: MediaQuery.of(context).size.height, // 화면 높이에 맞추도록 설정
          child: Center(
            child: Container(
              width: 424,
              height: 805,
              decoration: BoxDecoration(
                color: Color(0xFF48AA7B),
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
              child: Stack(
                children: [
                  Positioned(
                    left: 120,
                    top: 40,
                    child: Text(
                      'Stage 1',
                      style: TextStyle(
                        color: Color(0xFFFFF3F3),
                        fontSize: 40,
                        fontFamily: 'ABeeZee',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 111,
                    top: 250,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFFFAF9E0),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 142,
                    top: 320,
                    child: SizedBox(
                      width: 140,
                      height: 250,
                      child: Text(
                        'Start',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFE02020),
                          fontSize: 30,
                          fontFamily: 'ABeeZee',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 550,
                    child: SizedBox(
                      width: 400,
                      height: 120,
                      child: Text(
                        '문제설명: 문제는 랜덤으로 주어집니다.\n10초 시간동안 표정을 유지해주세요 \n찍는 사진수는 3장입니다.',
                        style: TextStyle(
                          color: Color(0xFFF5F5F5),
                          fontSize: 15,
                          fontFamily: 'ABeeZee',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
