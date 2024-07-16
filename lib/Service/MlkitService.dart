import 'dart:io';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

Future<List<FaceLandmark>> detectFaceLandmarks(File imageFile) async {
  final inputImage = InputImage.fromFile(imageFile);
  final faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableLandmarks: true,
      enableClassification: true,
      enableTracking: true,
    ),
  );

  final List<Face> faces = await faceDetector.processImage(inputImage);

  if (faces.isNotEmpty) {
    // 첫 번째 얼굴의 랜드마크만 사용 (필요시 여러 얼굴에 대해 처리 가능)
    return faces.first.landmarks.values.where((landmark) => landmark != null).toList().cast<FaceLandmark>();
  } else {
    return [];
  }
}