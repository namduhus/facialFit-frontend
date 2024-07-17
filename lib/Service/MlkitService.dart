import 'dart:io';
import 'dart:math';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

Future<Map<String, List<Point<int>>>> detectFaceLandmarks(File imageFile) async {
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
  final Map<String, List<Point<int>>> faceData = {};

  if (faces.isNotEmpty) {
    final face = faces.first;

    // 랜드마크 저장
    faceData['landmarks'] = [];
    FaceLandmarkType.values.forEach((type) {
      final landmark = face.landmarks[type];
      if (landmark != null) {
        faceData['landmarks']!.add(landmark.position);
      }
    });

    // 컨투어 저장
    FaceContourType.values.forEach((type) {
      final contour = face.contours[type];
      if (contour != null) {
        faceData[type.name] = contour.points;
      }
    });
  }

  return faceData;
}