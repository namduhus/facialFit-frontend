import 'package:SmileHelper/game/controller/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MessageView extends GetView<ScanController> {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ScanController>(builder: (controller) {
      if (!controller.isInitialized) {
        return Container();
      }
      Logger().e("controller.text: ${controller.text}");

      return Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            child: Text(
              controller.currentStage,
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          _buildImageWidget(controller),
        ],
      );
    });
  }

  Widget _buildImageWidget(ScanController controller) {
    switch (controller.text) {
      case 'smiled':
        return Positioned(child: Image.asset('assets/images/button.png'));
      case 'frowned':
        return Positioned(child: Image.asset('assets/images/coin.png'));
      case 'mouth_opened':
        return Positioned(child: Image.asset('assets/images/desk.png'));
      case 'eyebrow_raised':
        return Positioned(child: Image.asset('assets/images/sound.png'));
      case 'eye_closed':
        return Positioned(child: Image.asset('assets/images/pot.png'));
      case 'cheek_puffed':
        return Positioned(child: Image.asset('assets/images/button.png'));
      default:
        return controller.landmarks.isEmpty
            ? Positioned(child: Text("aegsrsr"))
            : Positioned(bottom: 120, child: Text("NULL"));
    }
  }

  _drawLandmarks() {}
  _drawContours() {}
}
