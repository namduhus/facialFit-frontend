import 'dart:io';

import 'package:SmileHelper/etc/buttons/capture/button.dart';
import 'package:SmileHelper/etc/buttons/capture/topimage.dart';
import 'package:SmileHelper/etc/buttons/pop.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:SmileHelper/game/camera_view.dart';
import 'package:SmileHelper/game/controller/scan_controller.dart';
import 'package:logger/logger.dart';
import 'package:video_player/video_player.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  State<CameraScreen> createState() => _ScreenState();
}

class _ScreenState extends State<CameraScreen> {
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
        ],
      ),
    );
  }

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    //thumbnailWidget();
    //카운트 후 촬영
    //Duration(seconds: 3);
    //Logger().e('initState: *');
    //Future.delayed(Duration(seconds: 3));
    //Logger().e('initState: $Duration(seconds: 3)');
    //Logger().e('initState: **');

    //CaptureButton().controller.takePicture();
    //Logger().e('initState: CaptureButton().controller.takePicture()');

    //TopImageViewer();
    //Logger().e('initState: TopImageViewer()');
  }
/*
  XFile? imageFile;
  VideoPlayerController? videoController;

  */
/*
  Widget thumbnailWidget() {
    final VideoPlayerController? localVideoController = videoController;
    //imageFile = controller.takePicture();
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (localVideoController == null && imageFile == null)
              Container()
            else
              SizedBox(
                width: 64.0,
                height: 64.0,
                child: (localVideoController == null)
                    ? (
                        // The captured image on the web contains a network-accessible URL
                        // pointing to a location within the browser. It may be displayed
                        // either with Image.network or Image.memory after loading the image
                        // bytes to memory.
                        kIsWeb
                            ? Image.network(imageFile!.path)
                            : Image.file(File(imageFile!.path)))
                    : Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink)),
                        child: Center(
                          child: AspectRatio(
                              aspectRatio:
                                  localVideoController.value.aspectRatio,
                              child: VideoPlayer(localVideoController)),
                        ),
                      ),
              ),
          ],
        ),
      ),
    );
  }
*/
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
