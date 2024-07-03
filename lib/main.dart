import 'package:flutter/material.dart';
import 'package:iccas_test1/etc/calendar.dart';
import 'package:iccas_test1/etc/quest.dart';
import 'package:iccas_test1/etc/shop.dart';
import 'package:iccas_test1/etc/statistics.dart';
import 'package:iccas_test1/etc/survey.dart';
import 'package:iccas_test1/game/bonus/play.dart';
import 'package:iccas_test1/game/bonus/start.dart';
import 'package:iccas_test1/game/story/start.dart';
import 'package:iccas_test1/login.dart';
import 'package:iccas_test1/main/select.dart';
import 'package:iccas_test1/main/stage.dart';
import 'package:iccas_test1/main/statefullStage.dart';
import 'package:iccas_test1/massage/select.dart';
import 'package:iccas_test1/register.dart';
import 'package:iccas_test1/settings/select.dart';

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
        body: BonusPlay(), //BonusStart() //Login(),
      ),
      initialRoute: "/BonusStart", //"/Login",
      routes: {
        "/Login": (context) => Login(),
        "/Register": (context) => Register(),
        "/Stage": (context) => MainStage(),
        "/GameSelect": (context) => SelectGame(),
        "/Calendar": (context) => Calendar(),
        "/Setting": (context) => Setting(),
        "/Shop": (context) => Shop(),
        "/Statistics": (context) => Statistics(),
        "/survey": (context) => Survey(),
        "/Quest": (context) => Quest(),
        "/MassageSelect": (context) => SelectMassage(),
        "/StateStage": (context) => StatefullMainStage(),
        "/BonusStart": (context) => BonusStart(),
      },
    );
  }
}
