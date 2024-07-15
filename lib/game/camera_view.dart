import 'package:SmileHelper/etc/buttons/pop.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:SmileHelper/game/controller/scan_controller.dart';
import 'package:logger/logger.dart';

class CameraView extends GetView<ScanController> {
  const CameraView({super.key});

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

  /*
  Positioned(
      child: GetBuilder<ScanController>{
        init: ScanController(),
        builder: (controller) {
          return controller.isCameraInitialized.value? Stack(
            children: [
              CameraPreview(controller.cameraController),
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green, width: 4.0),
                ),
                child: Column(mainAxisSize: MainAxisSize.min,children: [
                  Container(color: Colors.white, child: Text("Label of object")),
                ],),
              )
            ],
          ):const Center(child: Text("loading preview..."));
        }
      },
    );


  */
}
