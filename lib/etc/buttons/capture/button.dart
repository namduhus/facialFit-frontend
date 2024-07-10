import 'dart:io';

import 'package:SmileHelper/game/controller/scan_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CaptureButton extends GetView<ScanController> {
  const CaptureButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      child: GestureDetector(
        onTap: () async {
          //await _initializeControllerFuture;
          final path = join(
              ('/assets/images/${DateTime.now().hour}.png')); //await getTemporaryDirectory()).path,
          Logger().e("path: $path");
          controller.takePicture().then((XFile? file) {
            controller.imageFile = file;

            Logger().e(
                "message-path: ${controller.imageFile?.path}"); //controller.imageFile!.path
            Logger().e("message-name: ${controller.imageFile?.name}");
          });
        },
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
