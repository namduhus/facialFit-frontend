import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class LandmarkPainter extends CustomPainter {
  final List<FaceLandmark> landmarks;

  LandmarkPainter(this.landmarks);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4.0
      ..style = PaintingStyle.fill;

    for (var landmark in landmarks) {
      canvas.drawCircle(
        Offset(landmark.position.x.toDouble(), landmark.position.y.toDouble()),
        4.0,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
