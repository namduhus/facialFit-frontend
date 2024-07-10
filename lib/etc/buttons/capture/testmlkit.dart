import 'package:SmileHelper/game/controller/scan_controller.dart';
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
                child: Text(
                  controller.text!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ));
  }
}
