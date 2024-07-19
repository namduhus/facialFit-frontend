import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SmileHelper/game/controller/scan_controller.dart';
import 'package:logger/logger.dart';

class ExpressView extends StatelessWidget {
  const ExpressView({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX의 initState 대신 onInit을 사용합니다.
    final ScanController controller = Get.find();

    return Obx(() {
      Logger().e('express_view: ${controller.currentExpression}');
      switch (controller.currExp.value) {
        case '눈썹 올리기':
          return Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset('assets/gifs/eyebrow.gif',
                    width: 125, height: 150),
              ));


        case '눈 감기':
          return Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/gifs/eyeclose.gif',
                  width: 125,
                  height: 150,
                ),
              ));

        case '볼 부풀리기':
          return Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/gifs/cheek.gif',
                  width: 125,
                  height: 150,
                ),
              ));

        case '입 오므리기':
          return Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset('assets/gifs/mouth_close.gif',
                    height: 150, width: 125),
              ));

        case '입 벌리기':
          return Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/gifs/mouth_open.gif',
                  width: 125,
                  height: 150,
                ),
              ));

        case '놀람':
          return Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/gifs/surprise.gif',
                  height: 150,
                  width: 125,
                ),
              ));

        case '웃음':
          return Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/gifs/smile.gif',
                  width: 125,
                  height: 150,
                ),
              ));

        case '찡그리기':
          return Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/gifs/frown.gif',
                  width: 125,
                  height: 150,
                ),
              ));

        default:
          return Container();
      }
    });
  }
}