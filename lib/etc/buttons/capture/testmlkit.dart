import 'package:SmileHelper/game/controller/scan_controller.dart';
import 'package:SmileHelper/game/mlkit/face_painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Testmlkit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ScanController>(
      builder: (controller) => Positioned(
        left: 165,
        top: 645,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            child: CustomPaint(),
          ), //CustomPaint(painter: controller.facePainter,),
        ),
      ),
    );
  }
}
