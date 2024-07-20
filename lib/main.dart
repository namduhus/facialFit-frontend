import 'package:SmileHelper/global_binding.dart';
import 'package:SmileHelper/game/camera_screen.dart';
import 'package:SmileHelper/game/camera_view.dart';
import 'package:SmileHelper/main/setting.dart';
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
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'calendar/calendar.dart';
import 'game/result/stageclear1.dart';
import 'game/result/stagefail1.dart';
import 'package:SmileHelper/game/story/start.dart';
import 'package:SmileHelper/game/story/story_stage.dart';
import 'package:SmileHelper/game/story/prolog.dart';
import 'package:SmileHelper/game/bonus/bonus_game.dart';
import 'splash.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart'; // splash.dart 파일 추가
import 'package:SmileHelper/main/second_page.dart'; // second_page.dart import

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko_KR', '');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventsProvider()),
        ChangeNotifierProvider(create: (_) => UserInfoProvider()),
      ],
      child: ScreenUtilInit(
        designSize: Size(360, 690), // Design size setting
        builder: (context, child) {
          return GetMaterialApp(
            initialBinding: GlobalBindings(),
            debugShowCheckedModeBanner: false,
            title: "Camera Application",
            theme: ThemeData(
              textTheme: GoogleFonts.robotoMonoTextTheme(
                Theme.of(context).textTheme,
              ).copyWith(
                bodyLarge: GoogleFonts.robotoMono(
                  textStyle: TextStyle(color: Colors.black, fontSize: 18),
                ),
                bodyMedium: GoogleFonts.robotoMono(
                  textStyle: TextStyle(color: Colors.black, fontSize: 16),
                ),
                headlineLarge: GoogleFonts.robotoMono(
                  textStyle: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
                ),
                // Add other needed text styles
              ),
            ),
            initialRoute: "/Splash",
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
              GetPage(name: '/bonus', page: () => BonusGame()),
              GetPage(name: '/Splash', page: () => SplashScreen()),
            ],
            routes: {
              "/Login": (context) => LoginMain(),
              "/Register": (context) => RegisterMain(),
              "/Home": (context) => MainHome(),
              "/Shop": (context) => ShopMain(),
              "/survey": (context) => Survey(
                registrationData: {},
              ),
              "/Quest": (context) => QuestTest2(),
              "/MyPage": (context) => MyPage(),
              "/Prolog": (context) => Prolog(),
              "/Story": (context) => StoryStage(),
              "/CameraView": (context) => CameraView(),
              "/CameraScreen": (context) => CameraScreen(),
              "/stageclear1": (context) => StageClear1(),
              "/stagefail1": (context) => StageFail(),
              "/Calendar": (context) => CalendarPage(),
              "/Setting": (context) => Setting(),
              "/SecondPage": (context) => SecondPage(), // second_page 추가
            },
          );
        },
        child: SplashScreen(), // 스플래시 스크린으로 초기 화면 설정
      ),
    );
  }
}
