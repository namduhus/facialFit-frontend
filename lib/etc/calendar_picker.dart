import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPicker extends StatefulWidget {
  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State<CalendarPicker> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        //시작
        firstDay: DateTime.utc(2024, 7, 1),
        //끝  -> 24년 7월 1일부터 25년 4월 1일까지 달력 사용 가능
        lastDay: DateTime.utc(2025, 4, 1),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(selectedDay, focusedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
        calendarBuilders:
            CalendarBuilders(markerBuilder: (context, day, event) {
          if (event.isNotEmpty) {
            List iconEvent = event;
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: event.length,
                itemBuilder: (context, index) {
                  Map key = iconEvent[index];
                  if (key['iconIndex'] == 1) {
                    return Container(
                        child: Icon(
                      size: 20,
                      Icons.favorite_border,
                      color: Colors.pink,
                    ));
                  } else if (key['iconIndex'] == 2) {
                    return Container(
                      child: Icon(
                        size: 20,
                        Icons.abc,
                        color: Colors.deepPurpleAccent,
                      ),
                    );
                  }
                  return Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Icon(
                        size: 20,
                        Icons.star_border_outlined,
                        color: Colors.yellowAccent,
                      ));
                });
          }
        }, dowBuilder: (context, day) {
          if (day.weekday == DateTime.saturday) {
            final text = DateFormat.E('ko').format(day);
            return Center(
                child: Text(
              text,
              style: TextStyle(color: Colors.blue),
            ));
          } else if (day.weekday == DateTime.sunday) {
            final text = DateFormat.E('ko').format(day);
            return Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.red),
              ),
            );
          }
        }),
      ),
    );
  }
}
