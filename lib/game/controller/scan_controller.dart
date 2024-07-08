import 'dart:developer';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tflite/tflite.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image/image.dart' as img;

class ScanController extends GetxController {
  ScanController({required List<CameraDescription> cameras}) {
    _cameras = cameras;
  }
  late List<CameraDescription> _cameras; //= <CameraDescription>[];
  late CameraController _cameraController;

  final RxBool _isInitialized = RxBool(false);

  CameraImage? _cameraImage;
  final RxList<Uint8List> _imageList = RxList([]);

  CameraController get cameraController => _cameraController;
  bool get isInitialized => _isInitialized.value;
  List<Uint8List> get imageList => _imageList;

  var isCameraInitialized = false.obs;
  var _imageCount = 0;

  @override
  void onInit() {
    _initCamera();
    super.onInit();
  }

  @override
  void dispose() {
    _isInitialized.value = false;
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> _initCamera() async {
/*
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
    }*/

    //_cameras = await availableCameras();
    Logger().e('_initCamera()');
    _cameraController = CameraController(_cameras[1], ResolutionPreset.veryHigh,
        imageFormatGroup: ImageFormatGroup.jpeg, enableAudio: false);

    _cameraController.initialize().then((value) async {
      _isInitialized.value = true;
      Logger().e('### _cameraController.initialize() ###');
      Logger().e('## not cameraImage ##');

      await _cameraController.startImageStream((CameraImage image) async {
        debugPrint("### _cameraController.startImageStream ###");
        Logger().e('## cameraImage done ##');
        _cameraImage = image;
        /*
        _imageCount++;
        if (_imageCount % 30 == 0) {
          _imageCount = 0;
        }*/
      });

      Logger().e('## after startImageStream ##');
      _isInitialized.refresh();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            log('User denied camera access', name: "접근 불가");
            print('User denied camera access.');
            break;
          default:
            log('Handler other errers', name: "핸들러 에러");
            print('Handle other errors.');
            break;
        }
      }
    });
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

  void capture() {
    Logger().e('_cameraImage?: $_cameraImage');
    //debugPrint(_cameraImage.toString());
    if (_cameraImage != null) {
      Logger().e('_cameraImage!!');
      img.Image image = img.Image.fromBytes(
        //format: img.Format.bgra8888,
        width: _cameraImage!.width,
        height: _cameraImage!.height,
        bytes: _cameraImage!.planes.first.bytes
            .buffer, //_cameraImage!.planes.first.bytes.buffer, // .planes[1].bytes,
      );

      Uint8List list = Uint8List.fromList(img.encodeJpg(image));
      _imageList.add(list);
      _imageList.refresh();
    }
  }
}
