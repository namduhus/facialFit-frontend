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
import 'package:SmileHelper/calendar/events_provider.dart';
import 'package:SmileHelper/calendar/user_info_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart'; // 추가: 올바른 import
import 'calendar/calendar.dart';
import 'game/result/stageclear1.dart';
import 'game/result/stagefail1.dart';
import 'package:SmileHelper/game/story/start.dart';
import 'package:SmileHelper/game/story/play.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko_KR', ''); // 수정: 빈 문자열 사용

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventsProvider()),
        ChangeNotifierProvider(create: (_) => UserInfoProvider()),
      ],
      child: ScreenUtilInit(
        designSize: Size(360, 690), // 디자인 기준 사이즈 설정
        builder: (context, child) {
          return GetMaterialApp(
            initialBinding: GlobalBindings(),
            debugShowCheckedModeBanner: false,
            title: "Camera Application",
            home: child,
            initialRoute: "/Login",
            getPages: [
              GetPage(
                name: '/CameraView',
                page: () => CameraView(),
              ),
              GetPage(
                name: '/CameraScreen',
                page: () => CameraScreen(),
                transition: Transition.zoom,
              ),
            ],
            routes: {
              "/Login": (context) => LoginMain(),
              "/Register": (context) => RegisterMain(),
              "/Home": (context) => MainHome(),
              "/Shop": (context) => ShopMain(),
              "/survey": (context) => Survey(registrationData: {},),
              "/Quest": (context) => QuestTest2(),
              "/MyPage": (context) => MyPage(),
              "/Start": (context) => StoryStart(),
              "/Play": (context) => StoryPlay(),
              "/CameraView": (context) => CameraView(),
              "/CameraScreen": (context) => CameraScreen(),
              "/stageclear1": (context) => StageClear(),
              "/stagefail1": (context) => StageFail(),
              "/Calendar": (context) => CalendarPage(),
              //"/CameraController": (context) => CameraController(camera, resolutionPreset),
            },
          );
        },
        child: LoginMain(), // 초기 화면 설정
      ),
    );
  }
}