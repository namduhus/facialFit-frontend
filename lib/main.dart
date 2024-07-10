import 'package:flutter/material.dart';
import 'package:SmileHelper/etc/calendar.dart';
import 'package:SmileHelper/etc/loading.dart';
import 'package:SmileHelper/quest/quest_test1.dart';
import 'package:SmileHelper/etc/statistics.dart';
import 'package:SmileHelper/game/bonus/start.dart';
import 'package:SmileHelper/main/select.dart';
import 'package:SmileHelper/main/stage.dart';
import 'package:SmileHelper/main/statefullStage.dart';
import 'package:SmileHelper/massage/select.dart';
import 'package:SmileHelper/settings/select.dart';
import 'package:SmileHelper/survey.dart';
import 'package:SmileHelper/register_main.dart';
import 'package:SmileHelper/login_main.dart';
import 'package:SmileHelper/shop/shop_main.dart';
import 'package:SmileHelper/quest/quest_test2.dart';
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
      initialRoute: "/LoginMain",
      routes: {
        "/RegisterMain": (context) => RegisterMain(),
        "/Survey": (context) => Survey(),
        "/LoginMain": (context) => LoginMain(),
        "/Stage": (context) => MainStage(),
        "/ShopMain": (context) => ShopMain(),
        "/GameSelect": (context) => SelectGame(),
        "/Calendar": (context) => Calendar(),
        "/Setting": (context) => Setting(),
        "/Statistics": (context) => Statistics(),
        "/Quest": (context) => QuestTest1(),
        "/Quest2": (context) => QuestTest2(),
        "/MassageSelect": (context) => SelectMassage(),
        "/StateStage": (context) => StatefullMainStage(),
        "/BonusStart": (context) => BonusStart(),
      },
    );
  }
}
