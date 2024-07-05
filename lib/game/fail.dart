import 'package:flutter/material.dart';

class StepFail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
                                left: 341,
                                top: 487,
                                child: SizedBox(
                                  width: 126,
                                  height: 57,
                                  child: Text(
                                    ': 4',
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
                                          text: 'Fail !!',
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
                                left: 196,
                                top: 364,
                                child: SizedBox(
                                  width: 176,
                                  height: 52,
                                  child: Text(
                                    '- 1 life',
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
                              Positioned(
                                left: 81,
                                top: 346,
                                child: Container(
                                  width: 99,
                                  height: 88,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/99x88"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 309,
                                top: 488,
                                child: Container(
                                  width: 63,
                                  height: 52,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/63x52"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 348,
                        top: 582,
                        child: SizedBox(
                          width: 41,
                          height: 24,
                          child: Text(
                            'retry',
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
