import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iccas_test1/game/controller/scan_controller.dart';

class CameraScreen extends GetView<ScanController> {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetX(builder: (controller) {
      if (!controller.value.isInitialized) {
        return Container();
      }
      return Container(child: CameraPreview(controller.cameraController));
    });
  }
}
