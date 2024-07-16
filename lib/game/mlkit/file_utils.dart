import 'dart:io';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:path_provider/path_provider.dart';

Future<void> saveLandmarksToFile(List<FaceLandmark> landmarks, String filePath) async {
  final file = File(filePath);

  String landmarksText = landmarks.map((landmark) {
    final position = landmark.position;
    return 'Type: ${landmark.type}, X: ${position.x}, Y: ${position.y}';
  }).join('\n');

  await file.writeAsString(landmarksText);
  print('랜드마크 좌표가 저장된 파일 경로: ${file.path}'); // 파일 경로 로그 출력
}