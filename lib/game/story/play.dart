////////Bouns stage 용

import 'package:flutter/material.dart';

class StoryPlay extends StatelessWidget {
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
                    top: 36,
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
                    left: 60,
                    top: 150,
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://via.placeholder.com/280x280"),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 60,
                    top: 450,
                    child: Container(
                      width: 300,
                      height: 250,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFAF9E0),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    top: 550,
                    child: Text(
                      '사용자 얼굴',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 216,
                    top: 189,
                    child: Text(
                      '5초',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
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
