import 'package:SmileHelper/CameraApp.dart';
import 'package:SmileHelper/game/camera_screen.dart';
import 'package:SmileHelper/game/camera_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:SmileHelper/etc/calendar.dart';
import 'package:SmileHelper/etc/loading.dart';
import 'package:SmileHelper/etc/quest.dart';
import 'package:SmileHelper/etc/shop.dart';
import 'package:SmileHelper/etc/statistics.dart';
import 'package:SmileHelper/etc/survey.dart';
import 'package:SmileHelper/game/bonus/play.dart';
import 'package:SmileHelper/game/bonus/start.dart';
import 'package:SmileHelper/game/story/start.dart';
import 'package:SmileHelper/global_binding.dart';
import 'package:SmileHelper/login.dart';
import 'package:SmileHelper/main/select.dart';
import 'package:SmileHelper/main/stage.dart';
import 'package:SmileHelper/main/statefullStage.dart';
import 'package:SmileHelper/massage/select.dart';
import 'package:SmileHelper/register.dart';
import 'package:SmileHelper/settings/select.dart';
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
      initialRoute: "/Login", //"/Login",
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
        //"/CameraController": (context) => CameraController(camera, resolutionPreset),
      },
    );

    */
  }
}
