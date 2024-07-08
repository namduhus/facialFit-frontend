import 'package:flutter/material.dart';
import 'package:SmileHelper/etc/calendar.dart';
import 'package:SmileHelper/etc/loading.dart';
import 'package:SmileHelper/etc/quest.dart';
import 'package:SmileHelper/etc/shop.dart';
import 'package:SmileHelper/etc/statistics.dart';
import 'package:SmileHelper/game/bonus/play.dart';
import 'package:SmileHelper/game/bonus/start.dart';
import 'package:SmileHelper/game/story/start.dart';
import 'package:SmileHelper/global_binding.dart';
import 'package:SmileHelper/login.dart';
import 'package:SmileHelper/main/select.dart';
import 'package:SmileHelper/main/stage.dart';
import 'package:SmileHelper/main/statefullStage.dart';
import 'package:SmileHelper/massage/select.dart';
import 'package:SmileHelper/settings/select.dart';
import 'package:SmileHelper/register2.dart';
import 'package:SmileHelper/survey.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //resizeToAvoidBottomInset: false,
        body: Loading(),
      ),
      initialRoute: "/LoginScreen",
      routes: {
        "/Stage": (context) => MainStage(),
        "/Survey": (context) => Survey(),
        "/Register": (context) => Register2(),
        "/LoginScreen": (context) => LoginScreen(),
        "/GameSelect": (context) => SelectGame(),
        "/Calendar": (context) => Calendar(),
        "/Setting": (context) => Setting(),
        "/Shop": (context) => Shop(),
        "/Statistics": (context) => Statistics(),
        "/Quest": (context) => Quest(),
        "/MassageSelect": (context) => SelectMassage(),
        "/StateStage": (context) => StatefullMainStage(),
        "/BonusStart": (context) => BonusStart(),
      },
    );
  }
}
