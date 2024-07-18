import 'dart:io';
import 'dart:math';

Future<void> saveLandmarksToFile(Map<String, List<Point<int>>> faceData, String filePath) async {
  final file = File(filePath);

  String landmarksText = faceData.entries.map((entry) {
    final pointsText = entry.value.map((point) => 'X: ${point.x}, Y: ${point.y}').join('\n');
    return 'Type: ${entry.key}\n$pointsText';
  }).join('\n\n');

  await file.writeAsString(landmarksText);
  print('File path where landmark and contour coordinates are saved: ${file.path}');
}