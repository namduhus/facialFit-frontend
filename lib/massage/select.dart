import 'package:flutter/material.dart';

class SelectMassage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 489,
          height: 841,
          child: Stack(
            children: [
              Positioned(
                left: 11,
                top: 0,
                child: Container(
                  width: 478,
                  height: 841,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: Color(0xFF207F66)),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 16,
                        top: 15,
                        child: Container(
                          width: 445,
                          height: 804,
                          decoration: ShapeDecoration(
                            color: Color(0xFF48AA7B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 42,
                        top: 747,
                        child: Container(
                          width: 107,
                          height: 49,
                          child: FlutterLogo(),
                        ),
                      ),
                      Positioned(
                        left: 66,
                        top: 759,
                        child: Container(
                          width: 41,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: SizedBox(
                                  width: 41,
                                  height: 24,
                                  child: Text(
                                    'shop',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 325,
                        top: 747,
                        child: Container(
                          width: 107,
                          height: 49,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 340,
                        top: 759,
                        child: SizedBox(
                          width: 82,
                          height: 24,
                          child: Text(
                            'statistics',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 184,
                        top: 747,
                        child: Container(
                          width: 106,
                          height: 49,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 204,
                        top: 759,
                        child: Text(
                          'home',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 33,
                        top: 33,
                        child: Container(
                          width: 393,
                          height: 265,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 36,
                                top: 4,
                                child: SizedBox(
                                  width: 31,
                                  height: 26,
                                  child: Text(
                                    '35',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFFBFBFB),
                                      fontSize: 17.77,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 362,
                                top: 239,
                                child: SizedBox(
                                  width: 31,
                                  height: 26,
                                  child: Text(
                                    '35',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFFBFBFB),
                                      fontSize: 17.77,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 400,
                        top: 28,
                        child: Container(width: 38, height: 41, child: Stack()),
                      ),
                      Positioned(
                        left: 295,
                        top: 29,
                        child: Container(
                          width: 48,
                          height: 41,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://via.placeholder.com/48x41"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 133,
                        top: 150,
                        child: Text(
                          'Massage',
                          style: TextStyle(
                            color: Color(0xFFFFF3F3),
                            fontSize: 51.53,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 391,
                        top: 271,
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.81,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 391,
                        top: 389,
                        child: Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.81,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 349,
                        top: 388,
                        child: Container(
                          width: 83,
                          height: 29,
                          decoration: ShapeDecoration(
                            color: Color(0xFF4DB144),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 349,
                        top: 270,
                        child: Container(
                          width: 83,
                          height: 29,
                          decoration: ShapeDecoration(
                            color: Color(0xFF4DB144),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 349,
                        top: 505,
                        child: Container(
                          width: 83,
                          height: 29,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 358,
                        child: Container(
                          width: 423,
                          height: 88,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFAF9E0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 475,
                        child: Container(
                          width: 423,
                          height: 88,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFAF9E0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 27,
                        top: 593,
                        child: Container(
                          width: 423,
                          height: 88,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFAF9E0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 240,
                        child: Container(
                          width: 423,
                          height: 88,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFAF9E0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        top: 248,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '1단계 : 기본 미소\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.77,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '표정 : 가볍고 자연스러운 미소',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.77,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 46,
                        top: 369,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '2단계 : 입술 늘이기\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.77,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '표정 : 입술을 가볍게 양 옆으로 늘림',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.77,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 46,
                        top: 481,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '3단계 : 눈썹 들어 올리기\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.77,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '표정 : 눈썹을 천천히 들어올림',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.77,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        top: 601,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '4단계 : 눈 감았다 뜨기\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.77,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '표정 : 천천히 눈을 감았다가 뜸',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.77,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 355,
                        top: 265,
                        child: Container(
                          width: 67,
                          height: 30,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 36,
                                top: 4,
                                child: SizedBox(
                                  width: 31,
                                  height: 26,
                                  child: Text(
                                    '1',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFDE2C2C),
                                      fontSize: 17.77,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 355,
                        top: 382,
                        child: Container(
                          width: 67,
                          height: 30,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 36,
                                top: 4,
                                child: SizedBox(
                                  width: 31,
                                  height: 26,
                                  child: Text(
                                    '2',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFDE2C2C),
                                      fontSize: 17.77,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 351,
                        top: 502,
                        child: Container(
                          width: 70,
                          height: 150,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 39,
                                top: 4,
                                child: SizedBox(
                                  width: 31,
                                  height: 26,
                                  child: Text(
                                    '3',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFDE2C2C),
                                      fontSize: 17.77,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 120,
                                child: Container(
                                  width: 67,
                                  height: 30,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 36,
                                        top: 4,
                                        child: SizedBox(
                                          width: 31,
                                          height: 26,
                                          child: Text(
                                            '4',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFFDE2C2C),
                                              fontSize: 17.77,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 11,
                top: 0,
                child: Container(
                  width: 478,
                  height: 841,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: Color(0xFF207F66)),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 16,
                        top: 15,
                        child: Container(
                          width: 445,
                          height: 804,
                          decoration: ShapeDecoration(
                            color: Color(0xFF48AA7B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 42,
                        top: 747,
                        child: Container(
                          width: 107,
                          height: 49,
                          child: FlutterLogo(),
                        ),
                      ),
                      Positioned(
                        left: 66,
                        top: 759,
                        child: Container(
                          width: 41,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: SizedBox(
                                  width: 41,
                                  height: 24,
                                  child: Text(
                                    'shop',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 325,
                        top: 747,
                        child: Container(
                          width: 107,
                          height: 49,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 340,
                        top: 759,
                        child: SizedBox(
                          width: 82,
                          height: 24,
                          child: Text(
                            'statistics',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 184,
                        top: 747,
                        child: Container(
                          width: 106,
                          height: 49,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 204,
                        top: 759,
                        child: Text(
                          'home',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 33,
                        top: 33,
                        child: Container(
                          width: 393,
                          height: 265,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 36,
                                top: 4,
                                child: SizedBox(
                                  width: 31,
                                  height: 26,
                                  child: Text(
                                    '35',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFFBFBFB),
                                      fontSize: 17.77,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 362,
                                top: 239,
                                child: SizedBox(
                                  width: 31,
                                  height: 26,
                                  child: Text(
                                    '35',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFFBFBFB),
                                      fontSize: 17.77,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 400,
                        top: 28,
                        child: Container(width: 38, height: 41, child: Stack()),
                      ),
                      Positioned(
                        left: 295,
                        top: 29,
                        child: Container(
                          width: 48,
                          height: 41,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://via.placeholder.com/48x41"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 133,
                        top: 150,
                        child: Text(
                          'Massage',
                          style: TextStyle(
                            color: Color(0xFFFFF3F3),
                            fontSize: 51.53,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 391,
                        top: 271,
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.81,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 391,
                        top: 389,
                        child: Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.81,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 349,
                        top: 388,
                        child: Container(
                          width: 83,
                          height: 29,
                          decoration: ShapeDecoration(
                            color: Color(0xFF4DB144),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 349,
                        top: 270,
                        child: Container(
                          width: 83,
                          height: 29,
                          decoration: ShapeDecoration(
                            color: Color(0xFF4DB144),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 349,
                        top: 505,
                        child: Container(
                          width: 83,
                          height: 29,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 358,
                        child: Container(
                          width: 423,
                          height: 88,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFAF9E0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 475,
                        child: Container(
                          width: 423,
                          height: 88,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFAF9E0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 27,
                        top: 593,
                        child: Container(
                          width: 423,
                          height: 88,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFAF9E0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 240,
                        child: Container(
                          width: 423,
                          height: 88,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFAF9E0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        top: 248,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '1단계 : 기본 미소\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.77,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '표정 : 가볍고 자연스러운 미소',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.77,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 46,
                        top: 369,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '2단계 : 입술 늘이기\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.77,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '표정 : 입술을 가볍게 양 옆으로 늘림',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.77,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 46,
                        top: 481,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '3단계 : 눈썹 들어 올리기\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.77,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '표정 : 눈썹을 천천히 들어올림',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.77,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        top: 601,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '4단계 : 눈 감았다 뜨기\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.77,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '표정 : 천천히 눈을 감았다가 뜸',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.77,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 355,
                        top: 265,
                        child: Container(
                          width: 67,
                          height: 30,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 36,
                                top: 4,
                                child: SizedBox(
                                  width: 31,
                                  height: 26,
                                  child: Text(
                                    '1',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFDE2C2C),
                                      fontSize: 17.77,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 355,
                        top: 382,
                        child: Container(
                          width: 67,
                          height: 30,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 36,
                                top: 4,
                                child: SizedBox(
                                  width: 31,
                                  height: 26,
                                  child: Text(
                                    '2',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFDE2C2C),
                                      fontSize: 17.77,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 351,
                        top: 502,
                        child: Container(
                          width: 70,
                          height: 150,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 39,
                                top: 4,
                                child: SizedBox(
                                  width: 31,
                                  height: 26,
                                  child: Text(
                                    '3',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFDE2C2C),
                                      fontSize: 17.77,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 120,
                                child: Container(
                                  width: 67,
                                  height: 30,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 36,
                                        top: 4,
                                        child: SizedBox(
                                          width: 31,
                                          height: 26,
                                          child: Text(
                                            '4',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFFDE2C2C),
                                              fontSize: 17.77,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 32,
                top: 757,
                child: Container(
                  width: 41,
                  height: 24,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 41,
                          height: 24,
                          child: Text(
                            'shop',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 745,
                child: Container(
                  width: 107,
                  height: 49,
                  child: FlutterLogo(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
