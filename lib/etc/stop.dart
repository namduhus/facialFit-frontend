import 'package:SmileHelper/etc/buttons/pop.dart';
import 'package:flutter/material.dart';

class Stop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                          left: 144,
                          top: 202,
                          child: Text(
                            '일시정지',
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
                          left: 144,
                          top: 202,
                          child: Text(
                            '일시정지',
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
                          left: 412,
                          top: 45,
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
                          left: 312,
                          top: 90,
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
                        Positioned(
                          left: 186,
                          top: 319,
                          child: Text(
                            'Play',
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
                          left: 149,
                          top: 486,
                          child: Text(
                            'Restart',
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
                          left: 183,
                          top: 652,
                          child: Text(
                            'Step',
                            style: TextStyle(
                              color: Color(0xFFFFF3F3),
                              fontSize: 51.53,
                              fontFamily: 'ABeeZee',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BtnPop(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
