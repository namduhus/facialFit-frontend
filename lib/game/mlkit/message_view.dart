import 'dart:ffi';

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
      Logger().e("MessageView start");
      if (!controller.isInitialized) {
        return Container();
      }
      //
      /*
      if (controller.contour.isNotEmpty) {
        List contour = controller.contour;
        int length = contour[controller.contour.length];

        Logger().e("length: $length");
        var last = controller.contour.last;
        Logger().e("last: $last");
        return Positioned(bottom: 120, child: Text("$length, ** $last"));
      }*/
      //return Container();
      return controller.boundingBox.isNotEmpty
          ? Positioned(child: Text("***"))
          : Positioned(bottom: 120, child: Text("NULL"));
    });
  }

  _drawLandmarks() {}
  _drawContours() {}
}
