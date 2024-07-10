import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:SmileHelper/game/controller/getPredict.dart';
import 'package:SmileHelper/game/controller/mlkit.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tflite/tflite.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image/image.dart' as img;
import 'package:video_player/video_player.dart';

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

  bool get canProcess => _canProcess;

  bool get isBusy => _isBusy;

  set isBusy(bool isBusy) {
    _isBusy = isBusy;
  }

  @override
  void onInit() {
    _initCamera();
    super.onInit();
  }

  @override
  void dispose() {
    _canProcess = false;
    _faceDetector.close();
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
      Logger().e('카메라캡처버튼클릭!!');
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

  Future<XFile?> takePicture() async {
    //final CameraController? cameraController = _controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      //showInSnackBar('Error: select a camera first.');
      Logger().e('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      Logger().e('takePicture(): $file');
      //Logger().e(file);
      final path = file.path;
      final Uint8List bytes = await File(path).readAsBytes();
      Logger().e('Uint8List bytes: $bytes');

      // predict
      Future<String> response =
          Getpredict().predict(file); //Image.file(File(path))
      Logger().e('take_picture: ${response}');
      //

      _imageList.add(bytes);

      _processImage(InputImage.fromFilePath(path));

      thumbnailWidget();

      _imageList.refresh();
      Logger().e('_imageList: $_imageList');

      return file;
    } on CameraException catch (e) {
      Logger().e(e);
      //_showCameraException(e);
      return null;
    }
  }

  XFile? imageFile;
  VideoPlayerController? videoController;

  Widget thumbnailWidget() {
    final VideoPlayerController? localVideoController = videoController;
    //imageFile = controller.takePicture();
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //Logger().e('thumbnailWidget: ${imageFile?.path}');
            if (imageFile == null) //localVideoController == null &&
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

//mlkit facedetector
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(enableContours: true, enableLandmarks: true),
  );
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  //RxString text = '' as RxString;
  var _cameraLensDirection = CameraLensDirection.front;
  String? _text;
  String? get text => this._text;

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    Logger().e('init _processimage');
    final faces = await _faceDetector.processImage(inputImage);
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = FaceDetectorPainter(
        faces,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
        _cameraLensDirection,
      );
      _customPaint = CustomPaint(painter: painter);

      Logger().e('_processimage done');
    } else {
      String text = 'Faces found: ${faces.length}\n\n';
      Logger().e('found face length: $text');
      for (final face in faces) {
        text += 'face: ${face.boundingBox}\n\n';
      }
      _text = text;
      Logger().e('found face boundingBox: $text');

      // TODO: set _customPaint to draw boundingRect on top of image
    }
    _isBusy = false;
  }
}
