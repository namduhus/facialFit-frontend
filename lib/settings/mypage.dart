import 'package:flutter/material.dart';

class Mypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
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
                          child:
                              Container(width: 38, height: 41, child: Stack()),
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
                          left: 52,
                          top: 221,
                          child: Container(
                            width: 373,
                            height: 496,
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
                          left: 140,
                          top: 110,
                          child: Text(
                            'My Page',
                            style: TextStyle(
                              color: Color(0xFFFFEFEF),
                              fontSize: 50,
                              fontFamily: 'ABeeZee',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 83,
                          top: 293,
                          child: Text(
                            'username',
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontSize: 20,
                              fontFamily: 'ABeeZee',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 83,
                          top: 382,
                          child: Text(
                            'Date of birth',
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontSize: 20,
                              fontFamily: 'ABeeZee',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 83,
                          top: 471,
                          child: Text(
                            'Personal Information Agreement',
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontSize: 20,
                              fontFamily: 'ABeeZee',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 83,
                          top: 560,
                          child: Text(
                            'Your Face',
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontSize: 20,
                              fontFamily: 'ABeeZee',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 88,
                          top: 604,
                          child: Container(
                            width: 137,
                            height: 40,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
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
                          left: 254,
                          top: 604,
                          child: Container(
                            width: 137,
                            height: 40,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
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
                          left: 104,
                          top: 614,
                          child: Text(
                            'Take a picture',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'ABeeZee',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 264,
                          top: 614,
                          child: Text(
                            'Select a picture',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
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
      ),
    );
  }
}
