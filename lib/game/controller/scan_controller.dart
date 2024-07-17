import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:async';
import 'package:SmileHelper/game/controller/getPredict.dart';
import 'package:SmileHelper/game/controller/mlkit.dart';
import 'package:SmileHelper/game/controller/stage_controller.dart';
import 'package:SmileHelper/game/result/stageclear1.dart';
import 'package:SmileHelper/game/result/stagefail1.dart';
import 'package:SmileHelper/main/main_stage.dart';
import 'package:SmileHelper/quest/quest_test2.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:logger/logger.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:path/path.dart';
import 'package:path/path.dart';
import 'package:video_player/video_player.dart';
import 'dart:math' as math;
import 'package:permission_handler/permission_handler.dart';

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
  final StageController stageController = Get.put(StageController());

  bool get isInitialized => _isInitialized.value;
  List<Uint8List> get imageList => _imageList;

  var isCameraInitialized = false.obs;
  var _imageCount = 0;

  // 스테이지 관련 변수 추가
  //스테이지 관리

  // "동작"

  int _currentStage = 0;
  // "동작"
  final List<List<String>> _stages = [
    ['눈웃음'], // 1단계
    ['눈웃음', '입 벌리기'], // 2단계
    ['눈웃음', '눈 감기'], // 3단계
    ['눈썹 들어올리기', '볼 부풀리기', '입 벌리기'], // 4단계
    ['입 벌리기', '눈 웃음', '눈 감기'], // 5단계
    ['웃기', '볼 부풀리기', '눈 찡그리기'] // 6단계
  ];
  // 표정을 랜덤으로 선택하는 함수
  void _selectRandomExpression() {
    var expressions = _stages[stageController.currentStage.value - 1];
    if (expressions != null) {
      currentExpression = expressions[Random().nextInt(expressions.length)];
    }
  }

  Timer? _stageTimer;

  String get currentStage =>
      '스테이지 ${stageController.currentStage.value}: ${_stages[stageController.currentStage.value - 1].join(', ')}';
  late String currentExpression; // 현재 스테이지에서 랜덤으로 선택된 표정

  bool get canProcess => _canProcess;

  bool get isBusy => _isBusy;

  get landmarks => _landmarks;

  set isBusy(bool isBusy) {
    _isBusy = isBusy;
  }

  bool _isDisposed = false;

  @override
  void onInit() async {
    super.onInit();
    /*if (await Permission.camera.request().isGranted) {
      _initCamera();
    } else {
      Get.snackbar('Error', 'Camera permission not granted',
          snackPosition: SnackPosition.BOTTOM);
    }*/

    _initCamera();
  }

  @override
  void dispose() {
    _canProcess = false;
    _faceDetector.close();
    _isInitialized.value = false;
    _imageList.clear();
    _cameraController.dispose();
  }

  //사진 찍은 횟수
  RxInt _picture_count = RxInt(0);
  get picture_count => _picture_count.value;

  // 유효성 검사 함수
  bool _validateStage(Face face) {
    //조건추가
    switch (_currentStage) {
      case 0:
        return face.smilingProbability != null &&
            face.smilingProbability! > 0.8;
      case 1:
        return _isMouthOpen(face);
      case 2:
        return _isEyeClosed(face);
      default:
        return false;
    }
  }

  // 스테이지 시작 함수
  void _startStage() {
    if (_stageTimer != null) {
      _stageTimer!.cancel();
    }
    // 표정을 랜덤으로 선택
    _selectRandomExpression();
    // 현재 스테이지 메시지 표시
    _showPopup('현재 스테이지: $currentStage, 표정: $currentExpression');
    // 각 스테이지에 맞는 사진 촬영 횟수 조정
    int requiredImages =
        _getRequiredImagesForStage(stageController.currentStage.value);

// 10초 뒤에 사진 촬영 및 스테이지 이동
    _stageTimer = Timer(Duration(seconds: 10), () {
      if (imageList.length < requiredImages) {
        takePicture().then((file) {
          if (file != null) {
            _processImage(InputImage.fromFilePath(file.path)).then((_) {
              _picture_count.value += 1;
              _moveToNextStage();
            });
          } else {
            _picture_count.value += 1;
            _moveToNextStage();
          }
        });
      } else {
        _moveToNextStage();
      }
    });
  }

//사진찍는횟수
  var _picture_limit = 3;
//끝났는지 판단
  var _isDone = false;
//맞은 개수
  RxInt correct = RxInt(0);
//틀린 개수
  RxInt wrong = RxInt(0);
  var isSuccessImageVisible = false.obs; // 성공 이미지 표시 상태
  var isFailImageVisible = false.obs; // 실패 이미지 표시 상태

  var isImageProcessing = false.obs; // 이미지 처리 중 플래그
  void _showSuccessImage() {
    isSuccessImageVisible.value = true;
    isImageProcessing.value = true;
    Timer(Duration(seconds: 1), () {
      isSuccessImageVisible.value = false;
      isImageProcessing.value = false;
      isSuccessImageVisible.value = true;
      isImageProcessing.value = true;
      isSuccessImageVisible.value = false;
      isImageProcessing.value = false;
    });
  }

  void _showFailImage() {
    isFailImageVisible.value = true;
    isImageProcessing.value = true;
    Timer(Duration(seconds: 1), () {
      isFailImageVisible.value = false;
      isImageProcessing.value = false;
    });
  }

// 각 스테이지에 필요한 사진 촬영 횟수를 반환하는 함수
  int _getRequiredImagesForStage(int stage) {
    switch (stage) {
      case 1:
        return 1;
      case 2:
      case 3:
        return 2;
      case 4:
      case 5:
      case 6:
        return 3;
      default:
        return 1;
    }
  }

  // 다음 스테이지로 이동
  void _moveToNextStage() async {
    int requiredImages =
        _getRequiredImagesForStage(stageController.currentStage.value);

    //종료조건
    if (imageList.length >= requiredImages) {
      await _showPopup('사진이 $requiredImages개가 됐어요 ');
      _showPopup(correct.value.toString());
      _showPopup(wrong.value.toString());

      Timer(Duration(seconds: 1), () {
        // 정답이 더 많으면 StageClear1 페이지로 이동, 그렇지 않으면 StageFail1 페이지로 이동
        if (correct.value >= wrong.value) {
          //같을경우 통과?하는
          //if (correct.value > wrong.value) { //값이 2씩 올라가긴한다
          Get.to(StageClear());
          debugPrint('성공 스테이지 이동');
          Logger().e("성공 스테이지 이동");
        } else {
          Get.to(StageFail());
        }
      });

      //종료하는척
      _isInitialized.value = false;
      _imageList.clear();

      correct.value = 0;
      wrong.value = 0;
      _currentStage = 0;
      stageController.setStage(1); // 초기화
      onClose();
    } else {
      //실행조건
      //_showPopup("사진이 아직 3개가 안됐어요");
      if (_message.value == 'success') {
        _showSuccessImage();
      } else if (_message.value == 'fail') {
        _showFailImage();
      }

      Logger()
          .e("실행조건: ${correct.value}  ${wrong.value}   ${imageList.length}}");
      _currentStage += 1;
      _startStage();
    }
  }

  _disposeCamera() {
    _canProcess = false;
    _faceDetector.close();
    _isInitialized.value = false;
    _imageList.clear();
    _cameraController.dispose();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _disposeCamera();
    super.onClose();
  }

// 카메라 초기화 후 스테이지 시작
  Future<void> _initCamera() async {
    if (_isDisposed) return;
    Logger().e('_initCamera()');

    try {
      _cameraController = CameraController(
          _cameras[1], ResolutionPreset.veryHigh,
          imageFormatGroup: ImageFormatGroup.jpeg, enableAudio: false);

      await _cameraController.initialize();
      if (_isDisposed) return; // dispose 상태인 경우 초기화 방지
      _isInitialized.value = true;
      await _cameraController.startImageStream((CameraImage image) async {
        _cameraImage = image;
      });

      _isInitialized.refresh();
      _startStage(); // 스테이지 시작
    } on CameraException catch (e) {
      if (e.code == 'CameraAccessDenied') {
        Logger().e('User denied camera access');
        Get.snackbar(
          'Error',
          'User denied camera access',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
        );
      } else {
        Logger().e('CameraException: ${e.code}');
        Get.snackbar(
          'Error',
          'Failed to initialize camera: ${e.code}',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
        );
      }
    } catch (e) {
      Logger().e('Unknown error: $e');
      Get.snackbar(
        'Error',
        'Unknown error occurred while initializing camera',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    }
  }

  Future<XFile?> takePicture() async {
    //final CameraController? cameraController = _controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      //showInSnackBar('Error: select a camera first.');
      Logger().e('Error: select a camera first.');
      return null;
    }
    if (isImageProcessing.value) {
      return null; // 이미지가 표시 중이면 사진 찍지 않음
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
  final RxList<Point<int>> _landmarks =
      RxList<Point<int>>(); // 얼굴 랜드마크 저장 FaceLandmark

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

    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
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
              _landmarks.add(landmark.position);

              Logger().e("landmark position: ${landmark.position}");
            }
          });

          bool isActionDetected = _validateStage(face);
          if (isActionDetected) {
            _showPopup('Success');
            isSuccessImageVisible.value = true;
            correct.value++;

            ///
            Future.delayed(Duration(seconds: 1), () {
              isSuccessImageVisible.value = false;
            });
          } else {
            _showPopup('Fail');

            wrong.value++;
            isFailImageVisible.value = true;
            Future.delayed(Duration(seconds: 1), () {
              isFailImageVisible.value = false;
            });
          }
        }
      }
      _text = text;
      _customPaint = CustomPaint(
        painter: FacePainter(),
      );
    }
    _isBusy = false;
  }

  bool _isEyebrowRaised(Face face) {
    FaceContour? leftEyebrowTop = face.contours[FaceContourType.leftEyebrowTop];
    FaceContour? leftEyebrowBottom =
        face.contours[FaceContourType.leftEyebrowBottom];
    FaceContour? rightEyebrowTop =
        face.contours[FaceContourType.rightEyebrowTop];
    FaceContour? rightEyebrowBottom =
        face.contours[FaceContourType.rightEyebrowBottom];

    if (leftEyebrowTop != null &&
        leftEyebrowBottom != null &&
        rightEyebrowTop != null &&
        rightEyebrowBottom != null) {
      double leftEyebrowTopY = leftEyebrowTop.points
              .map((p) => p.y.toDouble())
              .reduce((a, b) => a + b) /
          leftEyebrowTop.points.length;
      double leftEyebrowBottomY = leftEyebrowBottom.points
              .map((p) => p.y.toDouble())
              .reduce((a, b) => a + b) /
          leftEyebrowBottom.points.length;
      double rightEyebrowTopY = rightEyebrowTop.points
              .map((p) => p.y.toDouble())
              .reduce((a, b) => a + b) /
          rightEyebrowTop.points.length;
      double rightEyebrowBottomY = rightEyebrowBottom.points
              .map((p) => p.y.toDouble())
              .reduce((a, b) => a + b) /
          rightEyebrowBottom.points.length;

      double leftEyebrowRaise = leftEyebrowBottomY - leftEyebrowTopY;
      double rightEyebrowRaise = rightEyebrowBottomY - rightEyebrowTopY;

      print('Left Eyebrow Top: $leftEyebrowTopY');
      print('Left Eyebrow Bottom: $leftEyebrowBottomY');
      print('Right Eyebrow Top: $rightEyebrowTopY');
      print('Right Eyebrow Bottom: $rightEyebrowBottomY');
      print('Left Eyebrow Raise: $leftEyebrowRaise');
      print('Right Eyebrow Raise: $rightEyebrowRaise');

      // 임계값 조정
      double threshold = 30.0; // 눈썹 올리는 임계값

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

    return leftEyeOpen != null &&
        rightEyeOpen != null &&
        leftEyeOpen < 0.2 &&
        rightEyeOpen < 0.2; // 임계값 설정
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
    FaceLandmark? upperMouth =
        face.landmarks[FaceLandmarkType.noseBase]; // 코 기저부를 윗입술로 사용

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
          (rightMouth.position.x.toDouble() - leftMouth.position.x.toDouble())
              .abs();
      double mouthHeight =
          (bottomMouth.position.y.toDouble() - upperMouth.position.y.toDouble())
              .abs();

      // 입 벌림 판단 기준 설정
      double ratio = mouthHeight / mouthWidth;

      // 매우 높은 임계값 설정
      double openThreshold = 1.0; // 1.0 이상이면 입을 벌렸다고 판단

      // 추가 조건: 최소 너비와 높이를 설정하여 잘못된 인식을 방지합니다.
      bool widthCondition = mouthWidth > 50; // 예시 값
      bool heightCondition = mouthHeight > 50; // 예시 값

      // 입술의 움직임을 감지하는 추가 조건
      bool mouthMovedCondition = mouthHeight > 20; // 예시 값

      return ratio > openThreshold &&
          widthCondition &&
          heightCondition &&
          mouthMovedCondition;
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
  RxList<Rect> boundingBox = RxList([]);
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
