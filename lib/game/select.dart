import 'package:flutter/material.dart';

import 'package:iccas_test1/game/bonus/start.dart';
import 'package:iccas_test1/game/story/start.dart';

class SelectMode extends StatelessWidget {
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
                          left: 116,
                          top: 134,
                          child: Container(
                            width: 280,
                            height: 277,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFAF9E0),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 78,
                          top: 282,
                          child: Container(
                            width: 320,
                            height: 304,
                            decoration: ShapeDecoration(
                              color: Color(0xFFEA3F3F),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 150,
                          top: 351,
                          child: Container(
                            width: 211,
                            height: 154,
                            decoration: ShapeDecoration(
                              color: Color(0xFFD9D9D9),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 18,
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
                          left: 26,
                          top: 33,
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

                        /*
                        setPosition(
                          99,
                          122,
                          context,
                          StoryStart(),
                          280,
                          277,
                          0xFFFAF9E0,
                          147,
                          239,
                          60,
                          72,
                          'Story Mode',
                          0xFFE02020,
                        ),*/

////////////////////////  story start  ////////////////////
                        Positioned(
                          left: 99,
                          top: 122,
                          child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StoryStart())),
                              child: Container(
                                width: 280,
                                height: 277,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFFAF9E0),
                                  shape: OvalBorder(),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Positioned(
                                    left: 147,
                                    top: 239,
                                    child: Text(
                                      'Story Mode',
                                      style: TextStyle(
                                        color: Color(0xFFE02020),
                                        fontSize: 36,
                                        fontFamily: 'ABeeZee',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ),

                        ///////////////////////  bonus  //////////////////////////////////////////

                        Positioned(
                          left: 99,
                          top: 481,
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BonusStart())),
                            child: Container(
                              width: 280,
                              height: 277,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFAF9E0),
                                shape: OvalBorder(),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Positioned(
                                  left: 132,
                                  top: 598,
                                  child: Text(
                                    'Bonus Mode',
                                    style: TextStyle(
                                      color: Color(0xFFE02020),
                                      fontSize: 36,
                                      fontFamily: 'ABeeZee',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        ////////////////////////////////////////////////////////////////////////////

                        Positioned(
                          left: 395,
                          top: 81,
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
      ),
    );
  }
}
