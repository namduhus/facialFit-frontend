import 'package:SmileHelper/global_binding.dart';
import 'package:SmileHelper/game/camera_screen.dart';
import 'package:SmileHelper/game/camera_view.dart';
import 'package:flutter/material.dart';
import 'package:SmileHelper/survey.dart';
import 'package:SmileHelper/register_main.dart';
import 'package:SmileHelper/login_main.dart';
import 'package:SmileHelper/shop/shop_main.dart';
import 'package:SmileHelper/quest/quest_test2.dart';
import 'package:get/get.dart';
import 'package:SmileHelper/main/main_stage.dart';
import 'package:SmileHelper/main/mypage.dart';
import 'game/result/stageclear1.dart';
import 'game/result/stagefail1.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(
      //camera: firstCamera,
      ));
}

class MyApp extends StatelessWidget {
  //final CameraDescription camera;

  const MyApp({
    super.key,
    //required this.camera,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GlobalBindings(),
      debugShowCheckedModeBanner: false,
      title: "Camera Application",
      home: LoginMain(),
      //Login(),
      initialRoute: "/stagefail1",
      //"/CameraScreen", //"/Login",
      getPages: [
        GetPage(
          name: '/CameraView',
          page: () => CameraView(),
          //binding: GlobalBindings()),
        ),
        GetPage(
          name: '/CameraScreen',
          page: () => CameraScreen(),
          transition: Transition.zoom,
          //binding: GlobalBindings()),
        )
      ],
      routes: {
        "/Login": (context) => LoginMain(),
        "/Register": (context) => RegisterMain(),
        "/Stage2": (context) => MainStage2(),
        "/Shop": (context) => ShopMain(),
        "/survey": (context) => Survey(registrationData: {},),
        "/Quest": (context) => QuestTest2(),
        "/MyPage": (context) => MyPage(),
        "/CameraView": (context) => CameraView(),
        "/CameraScreen": (context) => CameraScreen(),
        "/stageclear1": (context) => StageClear(),
        "/stagefail1": (context) => StageFail(),
        //"/CameraController": (context) => CameraController(camera, resolutionPreset),
      },
    );
  }
}