import 'package:flutter/material.dart';

class StepClear extends StatelessWidget {
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
                                left: 19,
                                top: 21,
                                child: Container(
                                  width: 436,
                                  height: 797,
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
                                left: 120,
                                top: 40,
                                child: SizedBox(
                                  width: 238,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: ' 1 Step\n\n',
                                          style: TextStyle(
                                            color: Color(0xFFFFF3F3),
                                            fontSize: 70,
                                            fontFamily: 'ABeeZee',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Clear !!',
                                          style: TextStyle(
                                            color: Color(0xFFFFF3F3),
                                            fontSize: 51.53,
                                            fontFamily: 'ABeeZee',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 170,
                                top: 421,
                                child: SizedBox(
                                  width: 176,
                                  height: 52,
                                  child: Text(
                                    '+ 3 coin',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFFFF3F3),
                                      fontSize: 45,
                                      fontFamily: 'ABeeZee',
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
                        left: 333,
                        top: 582,
                        child: SizedBox(
                          width: 70,
                          height: 24,
                          child: Text(
                            'continue',
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
                left: 58,
                top: 570,
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
                left: 89,
                top: 582,
                child: SizedBox(
                  width: 44,
                  height: 24,
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
