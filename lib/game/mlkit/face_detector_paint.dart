import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FaceDetectorPainter extends CustomPainter {
  FaceDetectorPainter(this.faces, this.imageSize, this.rotation, this.cameraLensDirection);

  final List<Face> faces;
  final Size imageSize;
  final InputImageRotation rotation;
  final CameraLensDirection cameraLensDirection;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = Colors.red;
    final Paint paint2 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0
      ..color = Colors.green;

    for (final Face face in faces) {
      final left = translateX(face.boundingBox.left, size, imageSize, rotation, cameraLensDirection);
      final top = translateY(face.boundingBox.top, size, imageSize, rotation, cameraLensDirection);
      final right = translateX(face.boundingBox.right, size, imageSize, rotation, cameraLensDirection);
      final bottom = translateY(face.boundingBox.bottom, size, imageSize, rotation, cameraLensDirection);

      // Draw bounding box
      canvas.drawRect(Rect.fromLTRB(left, top, right, bottom), paint1);

      // Draw landmarks
      for (final FaceLandmarkType type in FaceLandmarkType.values) {
        final FaceLandmark? landmark = face.landmarks[type];
        if (landmark != null) {
          canvas.drawCircle(
            Offset(
              translateX(landmark.position.x.toDouble(), size, imageSize, rotation, cameraLensDirection),
              translateY(landmark.position.y.toDouble(), size, imageSize, rotation, cameraLensDirection),
            ),
            2,
            paint2,
          );
        }
      }
    }
  }

  double translateX(double x, Size size, Size absoluteImageSize, InputImageRotation rotation, CameraLensDirection cameraLensDirection) {
    switch (rotation) {
      case InputImageRotation.rotation90deg:
        return x * size.width / (Platform.isIOS ? absoluteImageSize.width : absoluteImageSize.height);
      case InputImageRotation.rotation270deg:
        return size.width - x * size.width / (Platform.isIOS ? absoluteImageSize.width : absoluteImageSize.height);
      case InputImageRotation.rotation0deg:
      case InputImageRotation.rotation180deg:
        switch (cameraLensDirection) {
          case CameraLensDirection.back:
            return x * size.width / absoluteImageSize.width;
          default:
            return size.width - x * size.width / absoluteImageSize.width;
        }
    }
  }

  double translateY(double y, Size size, Size absoluteImageSize, InputImageRotation rotation, CameraLensDirection cameraLensDirection) {
    switch (rotation) {
      case InputImageRotation.rotation90deg:
      case InputImageRotation.rotation270deg:
        return y * size.height / (Platform.isIOS ? absoluteImageSize.height : absoluteImageSize.width);
      case InputImageRotation.rotation0deg:
      case InputImageRotation.rotation180deg:
        return y * size.height / absoluteImageSize.height;
    }
  }

  @override
  bool shouldRepaint(FaceDetectorPainter oldDelegate) {
    return oldDelegate.imageSize != imageSize || oldDelegate.faces != faces;
  }
}