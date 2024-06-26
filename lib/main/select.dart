import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iccas_test1/game/select.dart';
import 'package:iccas_test1/massage/select.dart';

class SelectGame extends StatelessWidget {
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
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 601,
                          child: Container(
                            width: 478,
                            height: 239,
                            decoration: BoxDecoration(color: Color(0xFF48AA7B)),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 1,
                          child: Container(
                            width: 478,
                            height: 600,
                            decoration: BoxDecoration(color: Color(0xFFFAF9E0)),
                          ),
                        ),
                        Positioned(
                          left: 292,
                          top: 319,
                          child: Container(
                            width: 193,
                            height: 283,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://via.placeholder.com/193x283"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 6,
                          top: 421,
                          child: Container(
                            width: 182,
                            height: 182,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://via.placeholder.com/182x182"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 44,
                          top: 755,
                          child: Container(
                            width: 107,
                            height: 49,
                            child: FlutterLogo(),
                          ),
                        ),
                        Positioned(
                          left: 76,
                          top: 767,
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
                          left: 327,
                          top: 755,
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
                          left: 346,
                          top: 768,
                          child: SizedBox(
                            width: 69,
                            height: 18,
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
                          left: 186,
                          top: 755,
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
                          left: 217,
                          top: 768,
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
                        Positioned(
                          left: 70,
                          top: 536,
                          child: Container(
                            width: 116,
                            height: 162,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://via.placeholder.com/116x162"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 23,
                          top: 21,
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
                                        color: Color(0xFF48AA7B),
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
                          left: 411,
                          top: 16,
                          child:
                              Container(width: 38, height: 41, child: Stack()),
                        ),
                        Positioned(
                          left: 306,
                          top: 17,
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
                          left: 354,
                          top: 78,
                          child: Text(
                            'USERNAME ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.77,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 151,
                          top: 87,
                          child: Container(
                            width: 201,
                            height: 197,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://via.placeholder.com/201x197"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),

                        ///////////////////////////  마사지  /////////////////////////////
                        Positioned(
                          left: 19,
                          top: 419,
                          child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SelectMassage())),
                              child: Container(
                                width: 157,
                                height: 103,
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
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Positioned(
                                      left: 321,
                                      top: 441,
                                      child: SizedBox(
                                        width: 123,
                                        height: 59,
                                        child: Text(
                                          '얼굴 마사지',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17.77,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w700,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    )),
                              )),
                        ),

                        ////////////////////////  게임  ///////////////////////////////////////
                        Positioned(
                          right: 19,
                          top: 419,
                          child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SelectMode())),
                              child: Container(
                                  width: 157,
                                  height: 103,
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
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Positioned(
                                        left: 36,
                                        top: 441,
                                        child: SizedBox(
                                          width: 123,
                                          height: 59,
                                          child: Text(
                                            '표정 짓기 게임',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.77,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      )))),
                        ),

                        Positioned(
                          left: 163,
                          top: 522,
                          child: Container(
                            width: 164,
                            height: 201,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://via.placeholder.com/164x201"),
                                fit: BoxFit.fill,
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
      ),
    );
  }
}
