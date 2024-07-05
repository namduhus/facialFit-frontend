import 'dart:developer';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tflite/tflite.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image/image.dart' as img;

class ScanController extends GetxController {
  final RxBool _isInitialized = RxBool(false);
  bool get isInitialized => _isInitialized.value;
  CameraController get cameraController => _cameraController;

  //capture
  final RxList<Uint8List> _imageList = RxList([]);
  List<Uint8List> get imageList => _imageList;

  @override
  void onInit() {
    super.onInit();

    _initCamera();
    _initTensorFlow();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    Tflite.close();
    super.dispose();
  }

  late CameraController _cameraController;
  late List<CameraDescription> _cameras;

  late CameraImage _cameraImage;

  var isCameraInitialized = false.obs;
  var _imageCount = 0;

  var x, y, w, h = 0.0;
  var label = "assets/labels/***";

  Future<void> _initCamera() async {
    if (await Permission.camera.request().isGranted) {
      _cameras = await availableCameras();
      _cameraController = CameraController(_cameras[1], ResolutionPreset.high,
          imageFormatGroup: ImageFormatGroup.bgra8888);

      _cameraController.initialize().then((value) {
        _isInitialized.value = true;

        //=> _cameraImage = image
        _cameraController.startImageStream((image) {
          _imageCount++;
          if (_imageCount % 30 == 0) {
            _imageCount = 0;
          }
        });
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              log('User denied camera access', name: "접근 불가");
              break;
            default:
              log('Handler other errers', name: "핸들러 에러");
              break;
          }
        }
      });
    } else {
      print("camera denied!!!");
      log("### camera denied log ### ", name: "access denied");
      debugPrint("hello world!");
    }
  }

  Future<void> objectDetector(CameraImage image) async {
    var recognitions = await Tflite.detectObjectOnFrame(
        bytesList: image.planes.map((plane) {
          return plane.bytes;
        }).toList(), // required
        model: "assets/models/***",
        imageHeight: image.height,
        imageWidth: image.width,
        imageMean: 127.5, // defaults to 127.5
        imageStd: 127.5, // defaults to 127.5
        rotation: 90, // defaults to 90, Android only
        numResultsPerClass: 2, // defaults to 5
        threshold: 0.1, // defaults to 0.1
        asynch: true // defaults to true
        );
  }

  //모델 초기화
  Future<void> _initTensorFlow() async {
    String? resolution = await Tflite.loadModel(
        model: "assets/models/***",
        labels: "assets/labels/***",
        numThreads: 1, //defaults to 1
        isAsset:
            true, //defaults to true, set to false to load resources outside assets
        useGpuDelegate: false);
  }

  Future<void> _objectRecognition(CameraImage img) async {
    var recognitions = await Tflite.runModelOnFrame(
        bytesList: img.planes.map((plane) {
          return plane.bytes;
        }).toList(), // required
        imageHeight: img.height,
        imageWidth: img.width,
        imageMean: 127.5, // defaults to 127.5
        imageStd: 127.5, // defaults to 127.5
        rotation: 90, // defaults to 90, Android only
        numResults: 2, // defaults to 5
        threshold: 0.1, // defaults to 0.1
        asynch: true // defaults to true
        );
    print(recognitions);
  }

  /*
  void capture() {
    img.Image images = img.Image.fromBytes(
        _cameraImage.width, _cameraImage.height, _cameraImage.planes[0].bytes,
        format: img.Format.bgra);
    Uint8List jpeg = Uint8List.fromList(img.encodeJpg(image));
    //print(jpeg.length);
    //print("Image Captured");
    _imageList.add(jpeg);
    _imageList.refresh();
  }*/
}
