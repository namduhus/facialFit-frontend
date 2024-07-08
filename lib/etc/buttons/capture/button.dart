import 'package:SmileHelper/game/controller/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class CaptureButton extends GetView<ScanController> {
  const CaptureButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      child: GestureDetector(
        onTap: () async {
          //controller._cameraImage == null ?

          controller.capture();
          //Logger().e('capture?'),
        }, //Logger().e('capture?'),
        child: Container(
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: Colors.white, width: 5)),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.camera,
                size: 60,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
