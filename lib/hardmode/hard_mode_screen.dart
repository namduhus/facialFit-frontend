import 'package:SmileHelper/hardmode/hard_mode_controller2.dart';
import 'package:SmileHelper/hardmode/hard_mode_controller3.dart';
import 'package:SmileHelper/hardmode/hard_mode_controller4.dart';
import 'package:SmileHelper/hardmode/hard_mode_controller5.dart';
import 'package:SmileHelper/hardmode/hard_mode_controller6.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:SmileHelper/css/screen.dart';
import 'hard_mode_controller.dart';

class HardModeScreen extends StatelessWidget {
  final List<CameraDescription> cameras;

  HardModeScreen({required this.cameras});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HardModeController(cameras: cameras));

    return BaseScreen(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Obx(() {
              if (controller.isInitialized) {
                return CameraPreview(controller.cameraController);
              } else {
                return Container(color: Colors.black);
              }
            }),
          ),
          Positioned(
            top: 50,
            child: Obx(() => Text(
              controller.message,
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
          ),
          Positioned(
            bottom: 50,
            child: Obx(() {
              if (!controller.isCapturing) {
                return ElevatedButton(
                  onPressed: controller.startStage,
                  child: Text('Start'),
                );
              } else if (controller.countdown > 0) {
                return Text(
                  '${controller.countdown}',
                  style: TextStyle(color: Colors.white, fontSize: 48),
                );
              } else {
                return Container();
              }
            }),
          ),
        ],
      ),
    );
  }
}

class HardModeScreen2 extends StatelessWidget {
  final List<CameraDescription> cameras;

  HardModeScreen2({required this.cameras});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HardModeController2(cameras: cameras));

    return BaseScreen(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Obx(() {
              if (controller.isInitialized) {
                return CameraPreview(controller.cameraController);
              } else {
                return Container(color: Colors.black);
              }
            }),
          ),
          Positioned(
            top: 50,
            child: Obx(() => Text(
              controller.message,
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
          ),
          Positioned(
            bottom: 50,
            child: Obx(() {
              if (controller.showStartButton) {
                return ElevatedButton(
                  onPressed: controller.startStage,
                  child: Text('Start'),
                );
              } else if (controller.isCapturing && controller.countdown > 0) {
                return Text(
                  '${controller.countdown}',
                  style: TextStyle(color: Colors.white, fontSize: 48),
                );
              } else {
                return Container(); // 빈 컨테이너를 반환하여 아무것도 표시하지 않음
              }
            }),
          ),
          Positioned(
            child: Obx(() => Text(
              controller.feedbackMessage,
              style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}
class HardModeScreen3 extends StatelessWidget {
  final List<CameraDescription> cameras;

  HardModeScreen3({required this.cameras});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HardModeController3(cameras: cameras));

    return BaseScreen(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Obx(() {
              if (controller.isInitialized) {
                return CameraPreview(controller.cameraController);
              } else {
                return Container(color: Colors.black);
              }
            }),
          ),
          Positioned(
            top: 50,
            child: Obx(() => Text(
              controller.message,
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
          ),
          Positioned(
            bottom: 50,
            child: Obx(() {
              if (controller.showStartButton) {
                return ElevatedButton(
                  onPressed: controller.startStage,
                  child: Text('Start'),
                );
              } else if (controller.isCapturing && controller.countdown > 0) {
                return Text(
                  '${controller.countdown}',
                  style: TextStyle(color: Colors.white, fontSize: 48),
                );
              } else {
                return Container(); // 빈 컨테이너를 반환하여 아무것도 표시하지 않음
              }
            }),
          ),
          Positioned(
            child: Obx(() => Text(
              controller.feedbackMessage,
              style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}

class HardModeScreen4 extends StatelessWidget {
  final List<CameraDescription> cameras;

  HardModeScreen4({required this.cameras});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HardModeController4(cameras: cameras));

    return BaseScreen(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Obx(() {
              if (controller.isInitialized) {
                return CameraPreview(controller.cameraController);
              } else {
                return Container(color: Colors.black);
              }
            }),
          ),
          Positioned(
            top: 50,
            child: Obx(() => Text(
              controller.message,
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
          ),
          Positioned(
            bottom: 50,
            child: Obx(() {
              if (controller.showStartButton) {
                return ElevatedButton(
                  onPressed: controller.startStage,
                  child: Text('Start'),
                );
              } else if (controller.isCapturing && controller.countdown > 0) {
                return Text(
                  '${controller.countdown}',
                  style: TextStyle(color: Colors.white, fontSize: 48),
                );
              } else {
                return Container(); // 빈 컨테이너를 반환하여 아무것도 표시하지 않음
              }
            }),
          ),
          Positioned(
            child: Obx(() => Text(
              controller.feedbackMessage,
              style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}

class HardModeScreen5 extends StatelessWidget {
  final List<CameraDescription> cameras;

  HardModeScreen5({required this.cameras});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HardModeController5(cameras: cameras));

    return BaseScreen(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Obx(() {
              if (controller.isInitialized) {
                return CameraPreview(controller.cameraController);
              } else {
                return Container(color: Colors.black);
              }
            }),
          ),
          Positioned(
            top: 50,
            child: Obx(() => Text(
              controller.message,
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
          ),
          Positioned(
            bottom: 50,
            child: Obx(() {
              if (controller.showStartButton) {
                return ElevatedButton(
                  onPressed: controller.startStage,
                  child: Text('Start'),
                );
              } else if (controller.isCapturing && controller.countdown > 0) {
                return Text(
                  '${controller.countdown}',
                  style: TextStyle(color: Colors.white, fontSize: 48),
                );
              } else {
                return Container(); // 빈 컨테이너를 반환하여 아무것도 표시하지 않음
              }
            }),
          ),
          Positioned(
            child: Obx(() => Text(
              controller.feedbackMessage,
              style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}

class HardModeScreen6 extends StatelessWidget {
  final List<CameraDescription> cameras;

  HardModeScreen6({required this.cameras});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HardModeController6(cameras: cameras));

    return BaseScreen(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Obx(() {
              if (controller.isInitialized) {
                return CameraPreview(controller.cameraController);
              } else {
                return Container(color: Colors.black);
              }
            }),
          ),
          Positioned(
            top: 50,
            child: Obx(() => Text(
              controller.message,
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
          ),
          Positioned(
            bottom: 50,
            child: Obx(() {
              if (controller.showStartButton) {
                return ElevatedButton(
                  onPressed: controller.startStage,
                  child: Text('Start'),
                );
              } else if (controller.isCapturing && controller.countdown > 0) {
                return Text(
                  '${controller.countdown}',
                  style: TextStyle(color: Colors.white, fontSize: 48),
                );
              } else {
                return Container(); // 빈 컨테이너를 반환하여 아무것도 표시하지 않음
              }
            }),
          ),
          Positioned(
            child: Obx(() => Text(
              controller.feedbackMessage,
              style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}