import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
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
                        top: 16,
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
                        left: 52,
                        top: 593,
                        child: Container(
                          width: 373,
                          height: 66,
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
                        left: 336,
                        top: 753,
                        child: Container(
                          width: 109,
                          height: 54,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 186,
                        top: 753,
                        child: Container(
                          width: 109,
                          height: 54,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 215,
                        top: 769,
                        child: Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.63,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 31,
                        top: 36,
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
                        left: 417,
                        top: 21,
                        child: Container(width: 38, height: 41, child: Stack()),
                      ),
                      Positioned(
                        left: 321,
                        top: 21,
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
                        left: 33,
                        top: 753,
                        child: Container(
                          width: 109,
                          height: 54,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 48,
                        top: 769,
                        child: Text(
                          'Statistics',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.63,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 353,
                        top: 769,
                        child: Text(
                          'Statistics',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.63,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 169,
                        top: 602,
                        child: Text(
                          'Version',
                          style: TextStyle(
                            color: Color(0xFFB0B0B0),
                            fontSize: 40.52,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 52,
                        top: 476,
                        child: Container(
                          width: 373,
                          height: 66,
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
                        left: 148,
                        top: 485,
                        child: Text(
                          'Language',
                          style: TextStyle(
                            color: Color(0xFFB0B0B0),
                            fontSize: 40.52,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 52,
                        top: 359,
                        child: Container(
                          width: 373,
                          height: 66,
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
                        left: 110,
                        top: 370,
                        child: Text(
                          'Sound On/Off',
                          style: TextStyle(
                            color: Color(0xFFB0B0B0),
                            fontSize: 40.52,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 52,
                        top: 242,
                        child: Container(
                          width: 373,
                          height: 66,
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
                        left: 148,
                        top: 251,
                        child: Text(
                          'My Page',
                          style: TextStyle(
                            color: Color(0xFFB0B0B0),
                            fontSize: 40.52,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 155,
                        top: 110,
                        child: Text(
                          'Setting',
                          style: TextStyle(
                            color: Color(0xFFFFEFEF),
                            fontSize: 50,
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
            ],
          ),
        ),
      ],
    );
  }
}
