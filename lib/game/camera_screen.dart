import 'dart:io';

import 'package:SmileHelper/etc/buttons/capture/button.dart';
import 'package:SmileHelper/etc/buttons/capture/testmlkit.dart';
import 'package:SmileHelper/etc/buttons/capture/topimage.dart';
import 'package:SmileHelper/etc/buttons/pop.dart';
import 'package:SmileHelper/game/controller/getPredict.dart';
import 'package:SmileHelper/game/mlkit/detector_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:SmileHelper/game/camera_view.dart';
import 'package:SmileHelper/game/controller/scan_controller.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:logger/logger.dart';
import 'package:video_player/video_player.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  State<CameraScreen> createState() => _ScreenState();
}

class _ScreenState extends State<CameraScreen> {
  //set _controller(ScanController _controller) {}
  late String _path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CameraView(),
          ),
          CaptureButton(),
          TopImageViewer(),
          /*DetectorView(
            title: 'detectorView',
            onImage: (inputImage) => InputImage.fromFilePath(_path),
          ),*/
          //Testmlkit(),
        ],
      ),
    );
  }

  //late CameraController _controller;
  //late Future<void> _initializeControllerFuture;
  String? t;
  @override
  initState() {
    super.initState();
    //_controller = CaptureButton().controller;
    //카운트 후 촬영
    Future.delayed(Duration(seconds: 3), () {
      CaptureButton().controller.takePicture();
      //_path = CaptureButton().controller.imageFile!.path;
      //Logger().e('initState: $_path');
      t = CaptureButton().controller.text;
      Logger().e("initState: $t in");
      //Getpredict().predict();
    });

    Logger().e("initState: $t out");
  }

  /*_processImage() {
    if (CaptureButton().controller.canProcess) return;
    if (CaptureButton().controller.isBusy) return;
    CaptureButton().controller.isBusy = true;
    setState(() {
      _text = ;
      Logger().e('_processImage: $_text');
    });
  }*/
}
