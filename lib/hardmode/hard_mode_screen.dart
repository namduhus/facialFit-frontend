import 'package:SmileHelper/hardmode/hard_mode_controller2.dart';
import 'package:SmileHelper/hardmode/hard_mode_controller3.dart';
import 'package:SmileHelper/hardmode/hard_mode_controller4.dart';
import 'package:SmileHelper/hardmode/hard_mode_controller5.dart';
import 'package:SmileHelper/hardmode/hard_mode_controller6.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:SmileHelper/css/screen.dart';
import 'package:logger/logger.dart';
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
                return CustomPaint(
                  painter: FaceOutlinePainter(controller.faceRect),
                  child: CameraPreview(controller.cameraController),
                );
              } else {
                return Container(color: Colors.black);
              }
            }),
          ),
          Positioned(
            top: 50,
            child: Obx(() => Text(
              controller.message,
              style: TextStyle(color: Colors.white, fontSize: 20),
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
          Positioned(
            top: 100,
            right: 30,
            child: Obx(() => _showExpress(controller.currentExpression)),
          ),
        ],
      ),
    );

  }

  Widget _showExpress(String expression) {
    switch (expression) {
      case 'SURPRISE':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/surprise.gif", width: 150, height: 150),
        );
      case 'OPEN_MOUTH':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/mouth_open.gif", width: 150, height: 150),
        );
      case 'BLINK':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/eyeclose.gif", width: 150, height: 150),
        );
      case 'RAISE_EYEBROWS':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/eyebrow.gif", width: 150, height: 150),
        );
      case 'PUFF_CHEEKS':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/cheek.gif", width: 150, height: 150),
        );
      case 'PUCKER_LIPS':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/mouth_close.gif", width: 150, height: 150),
        );
      case 'TEMP1':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/frown.gif", width: 150, height: 150),
        );
      default:
        return Container();
    }
  }
}

class FaceOutlinePainter extends CustomPainter {
  final Rect? faceRect;

  FaceOutlinePainter(this.faceRect);

  @override
  void paint(Canvas canvas, Size size) {
    if (faceRect != null) {
      final paint = Paint()
        ..color = Colors.red
        ..strokeWidth = 3.0
        ..style = PaintingStyle.stroke;

      canvas.drawRect(faceRect!, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;


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
                return CustomPaint(
                  painter: FaceOutlinePainter(controller.faceRect),
                  child: CameraPreview(controller.cameraController),
                );
              } else {
                return Container(color: Colors.black);
              }
            }),
          ),
          Positioned(
            top: 50,
            child: Obx(() => Text(
              controller.message,
              style: TextStyle(color: Colors.white, fontSize: 20),
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
                Logger().e('assets/images/countdown${controller.countdown}.png');
                return Image.asset(
                  'assets/images/countdown${controller.countdown}.png', // countdown 이미지 경로
                  height: 150, // 이미지의 높이 조절
                  width: 500, // 이미지의 너비 조절
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
          Positioned(
            top: 100,
            right: 30,
            child: Obx(() => _showExpress(controller.currentExpression.value)),
          ),
        ],
      ),
    );
  }

  Widget _showExpress(String expression) {
    switch (expression) {
      case 'SURPRISE':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/surprise.gif", width: 150, height: 150),
        );
      case 'OPEN_MOUTH':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/mouth_open.gif", width: 150, height: 150),
        );
      case 'BLINK':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/eyeclose.gif", width: 150, height: 150),
        );
      case 'RAISE_EYEBROWS':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/eyebrow.gif", width: 150, height: 150),
        );
      case 'PUFF_CHEEKS':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/cheek.gif", width: 150, height: 150),
        );
      case 'PUCKER_LIPS':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/mouth_close.gif", width: 150, height: 150),
        );
      case 'TEMP1':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/frown.gif", width: 150, height: 150),
        );
      default:
        return Container();
    }
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
                return CustomPaint(
                  painter: FaceOutlinePainter(controller.faceRect),
                  child: CameraPreview(controller.cameraController),
                );
              } else {
                return Container(color: Colors.black);
              }
            }),
          ),
          Positioned(
            top: 50,
            child: Obx(() => Text(
              controller.message,
              style: TextStyle(color: Colors.white, fontSize: 20),
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
                return Image.asset(
                  'assets/images/countdown${controller.countdown}.png', // countdown 이미지 경로
                  height: 150, // 이미지의 높이 조절
                  width: 500,  // 이미지의 너비 조절
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
          Positioned(
            top: 100,
            right: 30,
            child: Obx(() => _showExpress(controller.currentExpression.value)),
          ),
        ],
      ),
    );
  }

  Widget _showExpress(String expression) {
    switch (expression) {
      case 'SURPRISE':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/surprise.gif", width: 150, height: 150),
        );
      case 'OPEN_MOUTH':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/mouth_open.gif", width: 150, height: 150),
        );
      case 'BLINK':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/eyeclose.gif", width: 150, height: 150),
        );
      case 'RAISE_EYEBROWS':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/eyebrow.gif", width: 150, height: 150),
        );
      case 'PUFF_CHEEKS':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/cheek.gif", width: 150, height: 150),
        );
      case 'PUCKER_LIPS':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/mouth_close.gif", width: 150, height: 150),
        );
      case 'TEMP1':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/frown.gif", width: 150, height: 150),
        );
      default:
        return Container();
    }
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
                return CustomPaint(
                  painter: FaceOutlinePainter(controller.faceRect),
                  child: CameraPreview(controller.cameraController),
                );
              } else {
                return Container(color: Colors.black);
              }
            }),
          ),
          Positioned(
            top: 50,
            child: Obx(() => Text(
              controller.message,
              style: TextStyle(color: Colors.white, fontSize: 20),
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
                return Image.asset(
                  'assets/images/countdown${controller.countdown}.png', // countdown 이미지 경로
                  height: 150, // 이미지의 높이 조절
                  width: 500,  // 이미지의 너비 조절
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
          Positioned(
            top: 100,
            right: 30,
            child: Obx(() => _showExpress(controller.currentExpression.value)),
          ),
        ],
      ),
    );
  }

  Widget _showExpress(String expression) {
    switch (expression) {
      case 'SURPRISE':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/surprise.gif", width: 150, height: 150),
        );
      case 'OPEN_MOUTH':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/mouth_open.gif", width: 150, height: 150),
        );
      case 'BLINK':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/eyeclose.gif", width: 150, height: 150),
        );
      case 'RAISE_EYEBROWS':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/eyebrow.gif", width: 150, height: 150),
        );
      case 'PUFF_CHEEKS':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/cheek.gif", width: 150, height: 150),
        );
      case 'PUCKER_LIPS':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/mouth_close.gif", width: 150, height: 150),
        );
      case 'TEMP1':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/frown.gif", width: 150, height: 150),
        );
      default:
        return Container();
    }
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
                return CustomPaint(
                  painter: FaceOutlinePainter(controller.faceRect),
                  child: CameraPreview(controller.cameraController),
                );
              } else {
                return Container(color: Colors.black);
              }
            }),
          ),
          Positioned(
            top: 50,
            child: Obx(() => Text(
              controller.message,
              style: TextStyle(color: Colors.white, fontSize: 20),
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
                return Image.asset(
                  'assets/images/countdown${controller.countdown}.png', // countdown 이미지 경로
                  height: 150, // 이미지의 높이 조절
                  width: 500,  // 이미지의 너비 조절
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
          Positioned(
            top: 100,
            right: 30,
            child: Obx(() => _showExpress(controller.currentExpression.value)),
          ),
        ],
      ),
    );
  }

  Widget _showExpress(String expression) {
    switch (expression) {
      case 'SURPRISE':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/surprise.gif", width: 150, height: 150),
        );
      case 'OPEN_MOUTH':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/mouth_open.gif", width: 150, height: 150),
        );
      case 'BLINK':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/eyeclose.gif", width: 150, height: 150),
        );
      case 'RAISE_EYEBROWS':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/eyebrow.gif", width: 150, height: 150),
        );
      case 'PUFF_CHEEKS':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/cheek.gif", width: 150, height: 150),
        );
      case 'PUCKER_LIPS':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/mouth_close.gif", width: 150, height: 150),
        );
      case 'TEMP1':
        return ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset("assets/gifs/frown.gif", width: 150, height: 150),
        );
      default:
        return Container();
    }
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
                return CustomPaint(
                  painter: FaceOutlinePainter(controller.faceRect),
                  child: CameraPreview(controller.cameraController),
                );
              } else {
                return Container(color: Colors.black);
              }
            }),
          ),
          Positioned(
            top: 50,
            child: Obx(() => Text(
              controller.message,
              style: TextStyle(color: Colors.white, fontSize: 20),
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
                return Image.asset(
                  'assets/images/countdown${controller.countdown}.png', // countdown 이미지 경로
                  height: 150, // 이미지의 높이 조절
                  width: 500,  // 이미지의 너비 조절
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
          Positioned(
            top: 100,
            right: 30,
            child: Obx(() => _showExpress(controller.currentExpression.value)),
          ),
        ],
      ),
    );
  }

  Widget _showExpress(String expression) {
    Widget expressionWidget;
    switch (expression) {
      case 'SURPRISE':
        expressionWidget = Image.asset("assets/gifs/surprise.gif", width: 150, height: 150);
        break;
      case 'OPEN_MOUTH':
        expressionWidget = Image.asset("assets/gifs/mouth_open.gif", width: 150, height: 150);
        break;
      case 'BLINK':
        expressionWidget = Image.asset("assets/gifs/eyeclose.gif", width: 150, height: 150);
        break;
      case 'RAISE_EYEBROWS':
        expressionWidget = Image.asset("assets/gifs/eyebrow.gif", width: 150, height: 150);
        break;
      case 'PUFF_CHEEKS':
        expressionWidget = Image.asset("assets/gifs/cheek.gif", width: 150, height: 150);
        break;
      case 'PUCKER_LIPS':
        expressionWidget = Image.asset("assets/gifs/mouth_close.gif", width: 150, height: 150);
        break;
      case 'TEMP1':
        expressionWidget = Image.asset("assets/gifs/frown.gif", width: 150, height: 150);
        break;
      default:
        expressionWidget = Container();
    }
    return Positioned(
      top: 110,
      right: 30,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(90),
        child: expressionWidget,
      ),
    );
  }
}
