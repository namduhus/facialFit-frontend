import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SmileHelper/game/controller/scan_controller.dart';
import 'package:logger/logger.dart';

class Countdown extends StatelessWidget {
  const Countdown({super.key});

  @override
  Widget build(BuildContext context) {
    final ScanController controller = Get.find();

    return Obx(() {
      if (!controller.isInitialized) {
        Logger().e("camera view error");
        return Container();
      }

      return Align(
        alignment: Alignment.topLeft,
        child: Text(
          controller.countdown.value.toString(),
          style: TextStyle(fontSize: 20),
        ),
      );
    });
  }
}