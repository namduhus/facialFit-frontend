import 'package:flutter/material.dart';

class Massaging extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 478,
          height: 841,
          child: Stack(
            children: [
              Positioned(
                left: 0,
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
                        top: 19,
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
                        left: 132,
                        top: 75,
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
                        left: 38,
                        top: 34,
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
                        left: 132,
                        top: 265,
                        child: Container(
                          width: 227,
                          height: 250,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://via.placeholder.com/227x250"),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 165,
                        top: 645,
                        child: Text(
                          '사용자 얼굴',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 81,
                        top: 171,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '3단계 - 눈썹 들어 올리기\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '          \n         영상을 보고 따라해주세요',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
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
                        left: 403,
                        top: 32,
                        child: SizedBox(
                          width: 24,
                          height: 34,
                          child: Text(
                            '||',
                            style: TextStyle(
                              color: Color(0xFFFFF3F3),
                              fontSize: 35,
                              fontFamily: 'ABeeZee',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 323,
                        top: 77,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(-1.57),
                          child: Container(
                            width: 49,
                            height: 44,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFF3F3),
                              shape: StarBorder.polygon(
                                side: BorderSide(
                                    width: 1, color: Color(0xFF6B6060)),
                                sides: 3,
                              ),
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
      ],
    );
  }
}
