import 'package:flutter/material.dart';
import 'package:iccas_test1/game/ending/fail.dart';
import 'package:iccas_test1/game/ending/success.dart';

class BonusPlay extends StatelessWidget {
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
                          left: 114,
                          top: 538,
                          child: Container(
                            width: 250,
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
                          left: 105,
                          top: 100,
                          child: Text(
                            'Bonus Mode',
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
                          left: 114,
                          top: 253,
                          child: Container(
                            width: 250,
                            height: 250,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://via.placeholder.com/250x250"),
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
                          left: 216,
                          top: 189,
                          child: Text(
                            '8초',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
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

                        //////////////////////////////////////////////////////성공테스트///////////////////////////////////////////////
                        Positioned(
                          left: 400,
                          top: 300,
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EndingSuccess())),
                            child: Transform(
                              transform: Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(0),
                              child: Container(
                                width: 49,
                                height: 44,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF516DFF),
                                  shape: StarBorder.polygon(
                                    side: BorderSide(
                                        width: 1, color: Color(0xFF6B6060)),
                                    sides: 3,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('성공테스트'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ///////////////////////////////////////////////실패테스트/////////////////////////////////////////////
                        Positioned(
                          left: 400,
                          top: 500,
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EndingFail())),
                            child: Transform(
                              transform: Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(0),
                              child: Container(
                                width: 49,
                                height: 44,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFFF00C7),
                                  shape: StarBorder.polygon(
                                    side: BorderSide(
                                        width: 1, color: Color(0xFF6B6060)),
                                    sides: 3,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("실패 테스트"),
                                ),
                              ),
                            ),
                          ),
                        )
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
