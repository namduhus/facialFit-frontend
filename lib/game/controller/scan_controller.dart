import 'dart:developer' as developer;
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:SmileHelper/game/controller/getPredict.dart';
import 'package:SmileHelper/game/controller/mlkit.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tflite/tflite.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image/image.dart' as img;
import 'package:video_player/video_player.dart';
import 'dart:math' as math;

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
      });

      Logger().e('## after startImageStream ##');
      _isInitialized.refresh();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            developer.log('User denied camera access', name: "접근 불가");
            print('User denied camera access.');
            break;
          default:

            developer.log('Handler other errers', name: "핸들러 에러");
            print('Handle other errors.');
            break;
        }
      }
    });
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

      //thumbnailWidget();

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

  final RxString _message = ''.obs; // 팝업 메시지
  String get message => _message.value;
  final RxList<FaceLandmark> _landmarks = RxList<FaceLandmark>(); // 얼굴 랜드마크 저장

// mlkit facedetector
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
        enableContours: true,
        enableLandmarks: true,
        enableClassification: true,
        enableTracking: true),
  );

  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;

  var _cameraLensDirection = CameraLensDirection.front;
  String? _text;
  String? get text => this._text;

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    Logger().e('init _processimage');
    final faces = await _faceDetector.processImage(inputImage);

    if (inputImage.metadata?.size != null && inputImage.metadata?.rotation != null) {
      final painter = FaceDetectorPainter(
        faces,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
        _cameraLensDirection,
      );
      _customPaint = CustomPaint(painter: painter);
    } else {
      String text = 'Faces found: ${faces.length}\n\n';
      Logger().e('found face length: $text');
      if (faces.isEmpty) {
        _showPopup('얼굴 없음');
      } else {
        for (final face in faces) {
          text += 'face: ${face.boundingBox}\n\n';
          boundingBox.add(face.boundingBox);
          contour.add(face.contours);

          Logger().e('boundingBox: $boundingBox');
          Logger().e('contour!!!!!: ${contour.first.entries}');
          _landmarks.clear();
          face.landmarks.forEach((type, landmark) {
            if (landmark != null &&
                (type == FaceLandmarkType.leftEye ||
                    type == FaceLandmarkType.rightEye ||
                    type == FaceLandmarkType.noseBase ||
                    type == FaceLandmarkType.leftMouth ||
                    type == FaceLandmarkType.rightMouth ||
                    type == FaceLandmarkType.bottomMouth)) {
              _landmarks.add(landmark);
            }
          });

          // 각 랜드마크의 위치를 로그로 출력
          face.landmarks.forEach((type, landmark) {
            if (landmark != null) {
              print('$type: ${landmark.position}');
            }
          });

          bool is_frowning = _isFrowned(face);
          bool isSmiling =
              face.smilingProbability != null && face.smilingProbability! > 0.8;
          bool isMouthOpen = _isMouthOpen(face);
          bool isEyebrowRaised = _isEyebrowRaised(face);
          bool isEyeClosed = _isEyeClosed(face);
          bool isCheekPuffed = _isCheekPuffed(face);

          if (isSmiling) {
            _showPopup('웃음');
          }

          if (is_frowning) {
            _showPopup('찡그림');
          }

          if (isMouthOpen) {
            _showPopup('입 벌림');
          }

          if (isEyebrowRaised) {
            _showPopup('눈썹 올리기');
          }

          if (isEyeClosed) {
            _showPopup('눈 감기');
          }

          if (isCheekPuffed) {
            _showPopup('볼 부풀리기');
          }
        }
      }
      _text = text;
      _customPaint = CustomPaint(
        painter: FacePainter(),
      );
      Logger().e('found face boundingBox: $text');
    }
    _isBusy = false;
  }

  bool _isFrowned(Face face) {
    final double? leftEye = face.leftEyeOpenProbability;
    final double? rightEye = face.rightEyeOpenProbability;

    Logger().e("left eye : $leftEye");
    Logger().e("right eye : $rightEye");

    //final int? mouth_bottom = face.mouth_bottom;
    Logger().e("contour?: $contour");

    if (leftEye! < 0.3 && rightEye! < 0.3) {
      return true;
    }
    return false;
  }

  bool _isEyebrowRaised(Face face) {
    FaceContour? leftEyebrowTop = face.contours[FaceContourType.leftEyebrowTop];
    FaceContour? leftEyebrowBottom = face.contours[FaceContourType.leftEyebrowBottom];
    FaceContour? rightEyebrowTop = face.contours[FaceContourType.rightEyebrowTop];
    FaceContour? rightEyebrowBottom = face.contours[FaceContourType.rightEyebrowBottom];

    if (leftEyebrowTop != null && leftEyebrowBottom != null &&
        rightEyebrowTop != null && rightEyebrowBottom != null) {

      double leftEyebrowTopY = leftEyebrowTop.points.map((p) => p.y.toDouble()).reduce((a, b) => a + b) / leftEyebrowTop.points.length;
      double leftEyebrowBottomY = leftEyebrowBottom.points.map((p) => p.y.toDouble()).reduce((a, b) => a + b) / leftEyebrowBottom.points.length;
      double rightEyebrowTopY = rightEyebrowTop.points.map((p) => p.y.toDouble()).reduce((a, b) => a + b) / rightEyebrowTop.points.length;
      double rightEyebrowBottomY = rightEyebrowBottom.points.map((p) => p.y.toDouble()).reduce((a, b) => a + b) / rightEyebrowBottom.points.length;

      double leftEyebrowRaise = leftEyebrowBottomY - leftEyebrowTopY;
      double rightEyebrowRaise = rightEyebrowBottomY - rightEyebrowTopY;

      print('Left Eyebrow Top: $leftEyebrowTopY');
      print('Left Eyebrow Bottom: $leftEyebrowBottomY');
      print('Right Eyebrow Top: $rightEyebrowTopY');
      print('Right Eyebrow Bottom: $rightEyebrowBottomY');
      print('Left Eyebrow Raise: $leftEyebrowRaise');
      print('Right Eyebrow Raise: $rightEyebrowRaise');

      // 임계값 조정
      double threshold = 38.1;  // 눈썹 올리는 임계값

      bool isLeftEyebrowRaised = leftEyebrowRaise > threshold;
      bool isRightEyebrowRaised = rightEyebrowRaise > threshold;

      return isLeftEyebrowRaised || isRightEyebrowRaised;
    }
    return false;
  }

  bool _isEyeClosed(Face face) {
    final double? leftEyeOpen = face.leftEyeOpenProbability;
    final double? rightEyeOpen = face.rightEyeOpenProbability;

    // 로그로 출력
    print('Left Eye Open Probability: $leftEyeOpen');
    print('Right Eye Open Probability: $rightEyeOpen');

    return leftEyeOpen != null && rightEyeOpen != null && leftEyeOpen < 0.2 && rightEyeOpen < 0.2; // 임계값 설정
  }

  bool _isCheekPuffed(Face face) {
    FaceContour? leftCheek = face.contours[FaceContourType.leftCheek];
    FaceContour? rightCheek = face.contours[FaceContourType.rightCheek];

    if (leftCheek != null && rightCheek != null) {
      double leftCheekArea = _calculateContourArea(leftCheek.points);
      double rightCheekArea = _calculateContourArea(rightCheek.points);

      // 로그로 출력
      print('Left Cheek Area: $leftCheekArea');
      print('Right Cheek Area: $rightCheekArea');

      return leftCheekArea > 1000 && rightCheekArea > 1000; // 임계값 설정
    }
    return false;
  }

  double _calculateContourArea(List<Point<int>> points) {
    // 다각형 면적 계산 (shoelace formula)
    double area = 0;
    for (int i = 0; i < points.length; i++) {
      int j = (i + 1) % points.length;
      area += points[i].x * points[j].y;
      area -= points[j].x * points[i].y;
    }
    area = area.abs() / 2.0;
    return area;
  }

  bool _isMouthOpen(Face face) {
    FaceLandmark? leftMouth = face.landmarks[FaceLandmarkType.leftMouth];
    FaceLandmark? rightMouth = face.landmarks[FaceLandmarkType.rightMouth];
    FaceLandmark? bottomMouth = face.landmarks[FaceLandmarkType.bottomMouth];
    FaceLandmark? upperMouth = face.landmarks[FaceLandmarkType.noseBase]; // 코 기저부를 윗입술로 사용

    if (leftMouth != null &&
        rightMouth != null &&
        bottomMouth != null &&
        upperMouth != null) {

      // 각 랜드마크의 위치를 로그로 출력
      print('Left Mouth: ${leftMouth.position}');
      print('Right Mouth: ${rightMouth.position}');
      print('Bottom Mouth: ${bottomMouth.position}');
      print('Upper Mouth (Nose Base): ${upperMouth.position}');

      double mouthWidth =
      (rightMouth.position.x.toDouble() - leftMouth.position.x.toDouble()).abs();
      double mouthHeight =
      (bottomMouth.position.y.toDouble() - upperMouth.position.y.toDouble()).abs();

      // 입 벌림 판단 기준 설정
      double ratio = mouthHeight / mouthWidth;

      // 매우 높은 임계값 설정
      double openThreshold = 1.0;  // 1.0 이상이면 입을 벌렸다고 판단

      // 추가 조건: 최소 너비와 높이를 설정하여 잘못된 인식을 방지합니다.
      bool widthCondition = mouthWidth > 50;  // 예시 값
      bool heightCondition = mouthHeight > 50;  // 예시 값

      // 입술의 움직임을 감지하는 추가 조건
      bool mouthMovedCondition = mouthHeight > 20; // 예시 값

      return ratio > openThreshold && widthCondition && heightCondition && mouthMovedCondition;
    }
    return false;
  }

  bool _showPopup(String message) {
    _message.value = message;
    Get.snackbar(
      '얼굴 인식 결과',
      _message.value, //message
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
    return message.isNotEmpty;
  }

  RxList<Map<FaceContourType, FaceContour?>> contour = RxList([]);
  //get contour => contour;
  RxList<Rect> boundingBox = RxList([]);
  //Rx<Widget> _facePainter;
  //get facePainter => _facePainter;
}

class FacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final radius = math.min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);
    // Draw the body
    final paint = Paint()..color = Colors.yellow;
    canvas.drawCircle(center, radius, paint);
    // Draw the mouth
    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius / 2), 0,
        math.pi, false, smilePaint);
    // Draw the eyes
    canvas.drawCircle(
        Offset(center.dx - radius / 2, center.dy - radius / 2), 10, Paint());
    canvas.drawCircle(
        Offset(center.dx + radius / 2, center.dy - radius / 2), 10, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
