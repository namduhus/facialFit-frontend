import 'package:flutter/material.dart';
//import 'package:table_calendar/table_calendar.dart';
import 'package:SmileHelper/etc/buttons/home.dart';
import 'package:SmileHelper/etc/buttons/statistics.dart';
import 'package:SmileHelper/etc/buttons/white/calendar.dart';
import 'package:SmileHelper/etc/buttons/white/quest.dart';
import 'package:SmileHelper/etc/buttons/white/setting.dart';
import 'package:SmileHelper/etc/calendar_picker.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

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
                      ],
                    ),
                  ),
                ),
                BtnCalendar(),
                btnQuest(),
                btnSetting(),
                BtnHome(),
                btnStatistics(),
                Positioned(
                  left: 35,
                  top: 180,
                  child: SizedBox(
                      width: 405, height: 480, child: CalendarPicker()),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
