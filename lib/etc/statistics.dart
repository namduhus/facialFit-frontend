import 'package:flutter/material.dart';
import 'package:iccas_test1/etc/buttons/home.dart';
import 'package:iccas_test1/etc/buttons/shop.dart';
import 'package:iccas_test1/etc/buttons/statistics.dart';
import 'package:iccas_test1/etc/buttons/white/calendar.dart';
import 'package:iccas_test1/etc/buttons/white/quest.dart';
import 'package:iccas_test1/etc/buttons/white/setting.dart';

class Statistics extends StatelessWidget {
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
                    decoration: ShapeDecoration(
                      color: Color(0xFFAFD7B6),
                      shape: RoundedRectangleBorder(side: BorderSide(width: 1)),
                      shadows: [
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
                          left: 17,
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
                          left: 29,
                          top: 26,
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
                          left: 396,
                          top: 21,
                          child:
                              Container(width: 38, height: 41, child: Stack()),
                        ),
                        Positioned(
                          left: 291,
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
                          left: 17,
                          top: 204,
                          child: Container(
                            width: 445,
                            height: 508,
                            decoration: BoxDecoration(color: Color(0x93FAF9E0)),
                          ),
                        ),
                        Positioned(
                          left: 79,
                          top: 339,
                          child: Container(
                            width: 289,
                            height: 137.09,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 137.09,
                                  child: Transform(
                                    transform: Matrix4.identity()
                                      ..translate(0.0, 0.0)
                                      ..rotateZ(-0.67),
                                    child: Container(
                                      width: 133.71,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 12,
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            color: Color(0xFF753BF0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 98.86,
                                  top: 53.74,
                                  child: Transform(
                                    transform: Matrix4.identity()
                                      ..translate(0.0, 0.0)
                                      ..rotateZ(0.41),
                                    child: Container(
                                      width: 105.54,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 12,
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            color: Color(0xFF753BF0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 193.93,
                                  top: 95.41,
                                  child: Transform(
                                    transform: Matrix4.identity()
                                      ..translate(0.0, 0.0)
                                      ..rotateZ(-0.79),
                                    child: Container(
                                      width: 134.69,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 12,
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            color: Color(0xFF753BF0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 131,
                          top: 324,
                          child: Container(
                            width: 289,
                            height: 137.09,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 137.09,
                                  child: Transform(
                                    transform: Matrix4.identity()
                                      ..translate(0.0, 0.0)
                                      ..rotateZ(-0.67),
                                    child: Container(
                                      width: 133.71,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 12,
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            color: Color(0xFFE15D5D),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 98.86,
                                  top: 53.74,
                                  child: Transform(
                                    transform: Matrix4.identity()
                                      ..translate(0.0, 0.0)
                                      ..rotateZ(0.41),
                                    child: Container(
                                      width: 105.54,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 12,
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            color: Color(0xFFE15D5D),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 193.93,
                                  top: 95.41,
                                  child: Transform(
                                    transform: Matrix4.identity()
                                      ..translate(0.0, 0.0)
                                      ..rotateZ(-0.79),
                                    child: Container(
                                      width: 134.69,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 12,
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            color: Color(0xFFE15D5D),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 29,
                          top: 126,
                          child: Text(
                            'Statistics',
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
                          left: 105,
                          top: 599,
                          child: SizedBox(
                            width: 325,
                            height: 96,
                            child: Text(
                              '1일     2일     3일     4일     5일',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.63,
                                fontFamily: 'ABeeZee',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          top: 360,
                          child: SizedBox(
                            width: 38,
                            height: 177,
                            child: Text(
                              '평\n\n균\n\n값',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.63,
                                fontFamily: 'ABeeZee',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 230,
                          top: 278,
                          child: SizedBox(
                            width: 138,
                            height: 29,
                            child: Text(
                              '7월',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.63,
                                fontFamily: 'ABeeZee',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 360,
                          top: 162,
                          child: Container(
                            width: 51,
                            height: 42,
                            decoration: BoxDecoration(color: Color(0xFFAFD7B6)),
                          ),
                        ),
                        Positioned(
                          left: 377,
                          top: 168,
                          child: SizedBox(
                            width: 24,
                            height: 37,
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 427,
                          top: 168,
                          child: SizedBox(
                            width: 24,
                            height: 37,
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
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
                BtnCalendar(),
                btnQuest(),
                btnSetting(),
                BtnHome(),
                btnStatistics(),
                btnShop(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
