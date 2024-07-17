import 'dart:io';
import 'dart:math';

Future<void> saveLandmarksToFile(Map<String, List<Point<int>>> faceData, String filePath) async {
  final file = File(filePath);

  String landmarksText = faceData.entries.map((entry) {
    final pointsText = entry.value.map((point) => 'X: ${point.x}, Y: ${point.y}').join('\n');
    return 'Type: ${entry.key}\n$pointsText';
  }).join('\n\n');

  await file.writeAsString(landmarksText);
  print('랜드마크 및 컨투어 좌표가 저장된 파일 경로: ${file.path}');
}