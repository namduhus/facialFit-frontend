import 'package:SmileHelper/global_binding.dart';
import 'package:SmileHelper/CameraApp.dart';
import 'package:SmileHelper/game/camera_screen.dart';
import 'package:SmileHelper/game/camera_view.dart';
import 'package:camera/camera.dart';
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
import 'package:SmileHelper/game/bonus/play.dart';
import 'package:get/get.dart';

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
      home: BonusStart(), //Login(),
      initialRoute: "/BonusStart", //"/CameraScreen", //"/Login",
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
        "/CameraView": (context) => CameraView(),
        "/CameraScreen": (context) => CameraScreen(),
        //"/CameraController": (context) => CameraController(camera, resolutionPreset),
      },
    );

    /*
    return GetMaterialApp(
      initialBinding: GlobalBindings(),
      debugShowCheckedModeBanner: false,
      title: "Camera Application",
      home: const CameraScreen(),
    );
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //resizeToAvoidBottomInset: false,
        body: Loading(),
        //TakePictureScreen(
        // Pass the appropriate camera to the TakePictureScreen widget.
        //camera: camera,
        //),
      ),
      initialRoute: "/LoginMain",
      initialBinding: GlobalBinding(),
      routes: {
        "/RegisterMain": (context) => RegisterMain(),
        "/Survey": (context) => Survey(),
        "/LoginMain": (context) => LoginMain(),
        "/Stage": (context) => StatefullMainStage(),
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
        "/BonusPlay": (context) => BonusPlay(),
        //"/CameraController": (context) => CameraController(camera, resolutionPreset),
      },
    );

    */
  }
}
