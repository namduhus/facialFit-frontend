import 'package:SmileHelper/game/controller/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Showstatusimage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScanController controller = Get.find();

    return Obx(() {
      return Center(
        child: Stack(
          children: [
            if (controller.isSuccessImageVisible.value)
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.asset('assets/gifs/smile1.gif'),
                ),
              ),
            if (controller.isFailImageVisible.value)
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.asset('assets/gifs/sad1.gif'),
                ),
              ),
          ],
        ),
      );
    });
  }
}