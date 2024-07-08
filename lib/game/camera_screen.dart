import 'package:SmileHelper/etc/buttons/capture/button.dart';
import 'package:SmileHelper/etc/buttons/capture/topimage.dart';
import 'package:SmileHelper/etc/buttons/pop.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:SmileHelper/game/camera_view.dart';
import 'package:SmileHelper/game/controller/scan_controller.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  State<CameraScreen> createState() => _ScreenState();
}

class _ScreenState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CameraView(),
          ),
          //CaptureButton(),
          //TopImageViewer(),
        ],
      ),
    );
  }
}

/*
      child: GetBuilder<ScanController>{
        init: ScanController(),
        builder: (controller) {
          return controller.isCameraInitialized.value? Stack(
            children: [
              CameraPreview(controller.cameraController),
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green, width: 4.0),
                ),
                child: Column(mainAxisSize: MainAxisSize.min,children: [
                  Container(color: Colors.white, child: Text("Label of object")),
                ],),
              )
            ],
          ):const Center(child: Text("loading preview..."));
        }
      },
*/