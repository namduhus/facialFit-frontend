// import 'dart:async';
// import 'dart:math';
// import 'package:SmileHelper/game/controller/stage_controller.dart';
// import 'package:get/get.dart';
// import 'camera_manager.dart';
// import 'face_recognition.dart';
// import 'utils2.dart';
// import 'package:SmileHelper/game/result/stageclear1.dart';
// import 'package:SmileHelper/game/result/stagefail1.dart';
//
// class StageManager extends GetxController {
//   final StageController stageController = Get.put(StageController());
//   final CameraManager cameraManager;
//   final FaceRecognition faceRecognition;
//   Timer? _stageTimer;
//   RxInt countdown = RxInt(0);
//   RxInt correct = RxInt(0);
//   RxInt wrong = RxInt(0);
//   RxString currExp = ''.obs;
//   RxBool isSuccessImageVisible = false.obs;
//   RxBool isFailImageVisible = false.obs;
//
//   StageManager(this.cameraManager, this.faceRecognition);
//
//   List<List<String>> _stages = [
//     ['웃음'],
//     ['웃음', '입 벌리기'],
//     ['웃음', '입 오므리기', '찡그리기'],
//     ['눈썹 올리기', '볼 부풀리기', '입 벌리기', '찡그리기'],
//     ['입 오므리기', '웃음', '놀람', '눈 감기', '볼 부풀리기'],
//     ['웃기', '볼 부풀리기', '찡그리기', '눈썹 올리기', '눈 감기', '놀람']
//   ];
//
//   int get currentStage => stageController.currentStage.value;
//   String get currentExpression => _currentExpression;
//   String _currentExpression = '';
//
//   @override
//   void onInit() {
//     super.onInit();
//     _startStage();
//   }
//
//   void _startStage() {
//     _selectRandomExpression();
//     showPopup('현재 스테이지: 스테이지 $currentStage, 표정: $currentExpression');
//     countdown.value = 10;
//     _stageTimer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (countdown.value == 0) {
//         timer.cancel();
//         cameraManager.takePicture().then((file) {
//           if (file != null) {
//             faceRecognition.processImage(file.path).then((_) {
//               _moveToNextStage();
//             });
//           }
//         });
//       } else {
//         countdown.value--;
//       }
//     });
//   }
//
//   void _moveToNextStage() {
//     if (cameraManager.imageList.length >= _getRequiredImagesForStage(currentStage)) {
//       if (correct.value >= wrong.value) {
//         Get.to(StageClear());
//       } else {
//         Get.to(StageFail());
//       }
//       _reset();
//     } else {
//       _startStage();
//     }
//   }
//
//   void _selectRandomExpression() {
//     var expressions = _stages[currentStage - 1];
//     _currentExpression = expressions[Random().nextInt(expressions.length)];
//     currExp.value = _currentExpression;
//   }
//
//   int _getRequiredImagesForStage(int stage) {
//     switch (stage) {
//       case 1: return 1;
//       case 2:
//       case 3: return 2;
//       default: return 3;
//     }
//   }
//
//   void _reset() {
//     correct.value = 0;
//     wrong.value = 0;
//     stageController.setStage(1);
//     cameraManager.clearImageList();
//   }
// }