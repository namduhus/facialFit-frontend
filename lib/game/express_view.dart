import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:SmileHelper/game/controller/scan_controller.dart';
import 'package:logger/logger.dart';

class ExpressView extends GetView<ScanController> {
  const ExpressView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ScanController>(initState: (state) {
      controller.onInit();
    }, builder: (controller) {
      if (!controller.isInitialized) {
        Logger().e("camera view error");
        //3 33controller.onInit();

        return Scaffold(
          body: SafeArea(
            //width: Get.width,
            //height: Get.height,
            child: controller.isInitialized
                ? CameraPreview(controller.cameraController)
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        );
      }

      return Stack(children: [
        Scaffold(
          body: SafeArea(
            //width: Get.width,
            //height: Get.height,
            child: controller.isInitialized
                ? CameraPreview(controller.cameraController)
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
        //controller.thumbnailWidget(),
      ]);
    });
  }
}
