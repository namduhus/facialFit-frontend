// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:SmileHelper/game/controller/scan_controller.dart';
// import 'package:logger/logger.dart';
//
// class CameraView extends StatelessWidget {
//   const CameraView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final ScanController controller = Get.find();
//
//     return Obx(() {
//       if (!controller.isInitialized) {
//         Logger().e("camera view error");
//         return Scaffold(
//           body: SafeArea(
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           ),
//         );
//       }
//
//       return Stack(
//         children: [
//           Scaffold(
//             body: SafeArea(
//               child: CameraPreview(controller.cameraController as CameraController),
//             ),
//           ),
//         ],
//       );
//     });
//   }
// }