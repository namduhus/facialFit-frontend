import 'package:SmileHelper/game/controller/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Showstatusimage extends GetView<ScanController> {
  @override
  Widget build(BuildContext context) {
    return GetX<ScanController>(builder: (controller) {
      // 성공 이미지 오버레이

      return Center(
        child: Stack(
          children: [
            controller.isSuccessImageVisible.value
                ? Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: 250,
                        height: 250,
                        child: Image.asset(
                          'assets/gifs/smile1.gif', //gifs/smile1.gif
                        )),
                  )
                : Container(),

            // 실패 이미지 오버레이
            controller.isFailImageVisible.value
                ? Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: 250,
                        height: 250,
                        child: Image.asset('assets/gifs/sad1.gif')),
                  ) //gifs/sad.gif
                : Container(),
          ],
        ),
      );
    });
  }
}
