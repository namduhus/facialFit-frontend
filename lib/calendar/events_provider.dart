import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventsProvider extends ChangeNotifier {
  Map<String, List<Map<String, dynamic>>> events = {};

  Map<String, List<Map<String, dynamic>>> getEvents() {
    return events;
  }

  void loadEvents(Map<String, List<Map<String, dynamic>>> loadedEvents) {
    events = loadedEvents;
    notifyListeners();
  }

  void clearEvents() {
    events.clear();
    notifyListeners();
  }

  String setEvents(DateTime day, String contents, int iconIndex) {
    String dayData = DateFormat('yy/MM/dd').format(day);
    Map<String, dynamic> eventContents = {
      "iconIndex": iconIndex,
      "contents": contents,
    };

    if (events.containsKey(dayData)) {
      if (events[dayData]!.length < 3) {
        events[dayData]!.add(eventContents);
      } else {
        return '초과';
      }
    } else {
      events[dayData] = [eventContents];
    }
    notifyListeners();
    return '성공';
  }

  void deleteEvents(DateTime? selectedDay, int index) {
    String dayData = DateFormat('yy/MM/dd').format(selectedDay!);
    if (events.containsKey(dayData)) {
      events[dayData]!.removeAt(index);
      if (events[dayData]!.isEmpty) {
        events.remove(dayData);
      }
      notifyListeners();
    }
  }
}
