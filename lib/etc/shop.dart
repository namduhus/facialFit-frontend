import 'package:flutter/material.dart';
import 'package:SmileHelper/etc/buttons/home.dart';
import 'package:SmileHelper/etc/buttons/shop.dart';
import 'package:SmileHelper/etc/buttons/statistics.dart';
import 'package:SmileHelper/etc/buttons/white/calendar.dart';
import 'package:SmileHelper/etc/buttons/white/quest.dart';
import 'package:SmileHelper/etc/buttons/white/setting.dart';
import 'package:SmileHelper/etc/shop_list.dart';

class Shop extends StatelessWidget {
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
                          left: 15,
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
                          left: 179,
                          top: 79,
                          child: Text(
                            'Shop',
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
                BtnCalendar(),
                btnQuest(),
                btnSetting(),
                BtnHome(),
                btnStatistics(),
                btnShop(),
                /////////////////////////////////////////////////////////////////////////////////

                Positioned(
                    left: 25,
                    top: 180,
                    child: Container(
                      width: 425,
                      height: 545,
                      //color: Colors.black,
                      child: ShopList(),
                    )),

                /////////////////////////////////////////////////////////////////////////////////
              ],
            ),
          ),
        ],
      ),
    );
  }
}
