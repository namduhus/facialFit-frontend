import 'dart:math';

import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'stage_manager.dart';

class FaceRecognition extends GetxController {
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableLandmarks: true,
      enableClassification: true,
      enableTracking: true,
    ),
  );

  final RxString _text = ''.obs;
  final RxList<Point<int>> _landmarks = RxList<Point<int>>();

  String get text => _text.value;
  List<Point<int>> get landmarks => _landmarks;

  Future<void> processImage(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    final faces = await _faceDetector.processImage(inputImage);

    for (final face in faces) {
      bool isActionDetected = _validateFace(face);
      if (isActionDetected) {
        Get.find<StageManager>().correct.value++;
        _showSuccessPopup();
      } else {
        Get.find<StageManager>().wrong.value++;
        _showFailPopup();
      }
    }

    if (faces.isNotEmpty) {
      final face = faces.first;
      _text.value = _getFaceExpression(face);
      _landmarks.value = face.landmarks.values.map((landmark) => landmark!.position).toList();
    } else {
      _text.value = '';
      _landmarks.clear();
    }
  }

  String _getFaceExpression(Face face) {
    // Implement logic to return the appropriate face expression text
    return 'expression';
  }

  bool _validateFace(Face face) {
    final stageManager = Get.find<StageManager>();
    switch (stageManager.currentExpression) {
      case '웃음': return _isSmile(face);
      case '입 벌리기': return _isMouthOpen(face);
      case '찡그리기': return _isFrowning(face);
      case '눈썹 올리기': return _isEyebrowRaised(face);
      case '볼 부풀리기': return _isCheekPuffed(face);
      case '입 오므리기': return _isLipsWhistling(face);
      case '놀람': return _isSurprise(face);
      case '눈 감기': return _isEyeClosed(face);
      default: return false;
    }
  }

  bool _isSmile(Face face) {
    return (face.smilingProbability! > 0.6) ? true : false;
  }
  //입 벌리기
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


  //찡그리기
  bool _isFrowning(Face face) {
    FaceContour? leftEyebrowTop = face.contours[FaceContourType.leftEyebrowTop];
    FaceContour? rightEyebrowTop =
    face.contours[FaceContourType.rightEyebrowTop];
    FaceContour? leftEye = face.contours[FaceContourType.leftEye];
    FaceContour? rightEye = face.contours[FaceContourType.rightEye];

    if (leftEyebrowTop != null &&
        rightEyebrowTop != null &&
        leftEye != null &&
        rightEye != null) {
      // 1. 눈썹 위치 계산
      double leftEyebrowY = leftEyebrowTop.points
          .map((p) => p.y.toDouble())
          .reduce((a, b) => a + b) /
          leftEyebrowTop.points.length;
      double rightEyebrowY = rightEyebrowTop.points
          .map((p) => p.y.toDouble())
          .reduce((a, b) => a + b) /
          rightEyebrowTop.points.length;

      // 2. 눈 크기 계산
      double leftEyeHeight = leftEye.points
          .map((p) => p.y.toDouble())
          .reduce((a, b) => a > b ? a : b) -
          leftEye.points
              .map((p) => p.y.toDouble())
              .reduce((a, b) => a < b ? a : b);
      double rightEyeHeight = rightEye.points
          .map((p) => p.y.toDouble())
          .reduce((a, b) => a > b ? a : b) -
          rightEye.points
              .map((p) => p.y.toDouble())
              .reduce((a, b) => a < b ? a : b);

      // 3. 얼굴 전체 높이에 대한 눈썹 위치의 비율 계산
      double faceHeight = face.boundingBox.height.toDouble();
      double faceTop = face.boundingBox.top.toDouble();
      double leftEyebrowPositionRatio = (leftEyebrowY - faceTop) / faceHeight;
      double rightEyebrowPositionRatio = (rightEyebrowY - faceTop) / faceHeight;

      // 4. 눈 크기의 비율 계산
      double leftEyeHeightRatio = leftEyeHeight / faceHeight;
      double rightEyeHeightRatio = rightEyeHeight / faceHeight;

      // 임계값 설정
      double eyebrowPositionThreshold = 0.24; // 눈썹이 내려온 비율
      double eyeHeightThreshold = 0.041; // 눈 크기

      print('Left Eyebrow Position Ratio: $leftEyebrowPositionRatio');
      print('Right Eyebrow Position Ratio: $rightEyebrowPositionRatio');
      print('Left Eye Height Ratio: $leftEyeHeightRatio');
      print('Right Eye Height Ratio: $rightEyeHeightRatio');

      // 찡그림 판단
      bool eyebrowsLowered =
          (leftEyebrowPositionRatio > eyebrowPositionThreshold) &&
              (rightEyebrowPositionRatio > eyebrowPositionThreshold);
      bool eyesNarrowed = (leftEyeHeightRatio < eyeHeightThreshold) &&
          (rightEyeHeightRatio < eyeHeightThreshold);

      return eyebrowsLowered && eyesNarrowed;
    }
    return false;
  }


  //눈썹 올리기
  bool _isEyebrowRaised(Face face) {
    FaceContour? leftEyebrowTop = face.contours[FaceContourType.leftEyebrowTop];
    FaceContour? leftEye = face.contours[FaceContourType.leftEye];
    FaceContour? rightEyebrowTop =
    face.contours[FaceContourType.rightEyebrowTop];
    FaceContour? rightEye = face.contours[FaceContourType.rightEye];

    if (leftEyebrowTop != null &&
        leftEye != null &&
        rightEyebrowTop != null &&
        rightEye != null) {
      // 왼쪽 눈썹의 평균 y 좌표를 계산합니다
      double leftEyebrowY = leftEyebrowTop.points
          .map((p) => p.y.toDouble())
          .reduce((a, b) => a + b) /
          leftEyebrowTop.points.length;

      // 오른쪽 눈썹의 평균 y 좌표를 계산합니다
      double rightEyebrowY = rightEyebrowTop.points
          .map((p) => p.y.toDouble())
          .reduce((a, b) => a + b) /
          rightEyebrowTop.points.length;

      // 왼쪽 눈의 평균 y 좌표를 계산합니다
      double leftEyeY =
          leftEye.points.map((p) => p.y.toDouble()).reduce((a, b) => a + b) /
              leftEye.points.length;

      // 오른쪽 눈의 평균 y 좌표를 계산합니다
      double rightEyeY =
          rightEye.points.map((p) => p.y.toDouble()).reduce((a, b) => a + b) /
              rightEye.points.length;

      // 눈썹과 눈 사이의 거리를 계산합니다
      double leftEyebrowEyeDistance = leftEyeY - leftEyebrowY;
      double rightEyebrowEyeDistance = rightEyeY - rightEyebrowY;

      // 얼굴 높이에 대한 상대적 거리를 계산합니다
      double relativeLeftDistance =
          leftEyebrowEyeDistance / face.boundingBox.height;
      double relativeRightDistance =
          rightEyebrowEyeDistance / face.boundingBox.height;

      // 임계값 설정
      double threshold = 0.09; // 얼굴 높이의 9%를 임계값으로 설정

      print('Left Eyebrow-Eye Distance: $relativeLeftDistance');
      print('Right Eyebrow-Eye Distance: $relativeRightDistance');

      return (relativeLeftDistance > threshold) &&
          (relativeRightDistance > threshold) &&
          ((relativeLeftDistance - relativeRightDistance).abs() < 0.004);
    }
    return false;
  }


  //볼 부풀리기
  bool _isCheekPuffed(Face face) {
    FaceContour? leftCheek = face.contours[FaceContourType.leftCheek];
    FaceContour? rightCheek = face.contours[FaceContourType.rightCheek];
    FaceContour? noseBridge = face.contours[FaceContourType.noseBridge];

    if (leftCheek != null && rightCheek != null && noseBridge != null) {
      // 양 볼의 가장 바깥쪽 점을 찾습니다
      Point<int> leftOuterPoint = leftCheek.points
          .reduce((curr, next) => curr.x < next.x ? curr : next);
      Point<int> rightOuterPoint = rightCheek.points
          .reduce((curr, next) => curr.x > next.x ? curr : next);

      // 코의 중앙점을 찾습니다
      Point<int> noseCenter = noseBridge.points[noseBridge.points.length ~/ 2];

      // 볼의 너비를 계산합니다
      double cheekWidth =
      (rightOuterPoint.x - leftOuterPoint.x).abs().toDouble();

      // 코에서 양 볼까지의 거리를 계산합니다
      double leftCheekDistance =
      (noseCenter.x - leftOuterPoint.x).abs().toDouble();
      double rightCheekDistance =
      (rightOuterPoint.x - noseCenter.x).abs().toDouble();

      // 볼의 대칭성을 확인합니다
      double cheekSymmetry =
          (leftCheekDistance - rightCheekDistance).abs() / cheekWidth;

      // 임계값 설정
      double widthThreshold = 0.41; // 얼굴 너비 대비 볼 너비의 임계값
      double symmetryThreshold = 0.1; // 볼 대칭성의 임계값

      print('Cheek Width: $cheekWidth');
      print('Face Width: ${face.boundingBox.width}');
      print('Cheek Symmetry: $cheekSymmetry');

      return (cheekWidth / face.boundingBox.width < widthThreshold) &&
          (cheekSymmetry < symmetryThreshold);
    }
    return false;
  }

  //입 오므리기
  bool _isLipsWhistling(Face face) {
    FaceLandmark? leftMouth = face.landmarks[FaceLandmarkType.leftMouth];
    FaceLandmark? rightMouth = face.landmarks[FaceLandmarkType.rightMouth];
    FaceLandmark? upperLip = face.landmarks[FaceLandmarkType.noseBase];
    FaceLandmark? lowerLip = face.landmarks[FaceLandmarkType.bottomMouth];

    if (leftMouth != null &&
        rightMouth != null &&
        upperLip != null &&
        lowerLip != null) {
      // 입 너비 계산
      double mouthWidth =
      (rightMouth.position.x - leftMouth.position.x).abs().toDouble();

      // 입 높이 계산
      double mouthHeight =
      (lowerLip.position.y - upperLip.position.y).abs().toDouble();

      // 입 모양 비율 계산 (높이/너비) - 값이 커질수록 입을 오무림
      double mouthRatio = mouthHeight / mouthWidth;

      print('Mouth Width: $mouthWidth');
      print('Mouth Height: $mouthHeight');
      print('Mouth Ratio: $mouthRatio');

      // 임계값 설정
      double widthThreshold = 210; // 입 너비 임계값 - 로그 보고 조정해야함
      double ratioThreshold = 0.8; // 입 오무리기 비율 - 낮을수록 난이도 내려감

      // 입 너비가 줄어들고, 동그랗게 변할 때 휘파람 모양으로 판단
      return mouthWidth < widthThreshold && mouthRatio > ratioThreshold;
    }
    return false;
  }

  //놀람
  bool _isSurprise(Face face) {
    return _isEyebrowRaised(face) && _isMouthOpen(face);
  }


  // 눈 감기
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

  void _showSuccessPopup() {
    Get.snackbar('Success', 'Correct expression detected', snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
  }

  void _showFailPopup() {
    Get.snackbar('Fail', 'Incorrect expression detected', snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
  }
}