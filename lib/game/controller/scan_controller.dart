// import 'dart:math';
//
// import 'package:camera/camera.dart';
// import 'package:get/get.dart';
// import 'package:logger/logger.dart';
// import 'camera_manager.dart';
// import 'stage_manager.dart';
// import 'face_recognition.dart';
// import 'utils2.dart';
//
// class ScanController extends GetxController {
//   final CameraManager cameraManager;
//   final StageManager stageManager;
//   final FaceRecognition faceRecognition;
//
//   ScanController({required List<CameraDescription> cameras})
//       : cameraManager = Get.put(CameraManager(cameras: cameras)),
//         faceRecognition = Get.put(FaceRecognition()),
//         stageManager = Get.put(StageManager(Get.find<CameraManager>(), Get.find<FaceRecognition>()));
//
//   @override
//   void onInit() {
//     super.onInit();
//     cameraManager.onInit();
//     stageManager.onInit();
//   }
//
//   @override
//   void dispose() {
//     cameraManager.dispose();
//     super.dispose();
//   }
//
//   bool get isInitialized => cameraManager.isInitialized;
//
//
//         //   Get.to(StageClear1(), this.cameraManager, this.stageManager, this.faceRecognition);
//         // } else {
//         //   Logger().e('실패이동');
//
//   CameraController get; cameraController => cameraManager.cameraController;
//
//   String get; text => faceRecognition.text;
//
//   List<Point<int>> get landmarks => faceRecognition.landmarks;
//
//   RxInt get countdown => stageManager.countdown;
//
//   String get currentExpression => stageManager.currentExpression;
//
//   RxString get currExp => stageManager.currExp;
//
//   RxBool get isSuccessImageVisible => stageManager.isSuccessImageVisible;
//
//   RxBool get isFailImageVisible => stageManager.isFailImageVisible;
//
//   Future<void> processImage(String imagePath) async {
//     await faceRecognition.processImage(imagePath);
//   }
//
//   Future<XFile?> takePicture() async {
//     return await cameraManager.takePicture();
//   }
//
//   void reset() {
//     cameraManager.clearImageList();
//   }
// }