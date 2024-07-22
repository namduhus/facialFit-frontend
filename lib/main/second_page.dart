import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final Map<String, List<Offset>> _coordinatesMap = {
    'landmarks': [],
    'face': [],
    'leftEyebrowTop': [],
    'leftEyebrowBottom': [],
    'rightEyebrowTop': [],
    'rightEyebrowBottom': [],
    'leftEye': [],
    'rightEye': [],
    'upperLipTop': [],
    'upperLipBottom': [],
    'lowerLipTop': [],
    'lowerLipBottom': [],
    'noseBridge': [],
    'noseBottom': [],
    'leftCheek': [],
    'rightCheek': [],
  };
  String? userId;
  File? _imageFile;
  File? _comparisonImageFile;
  bool _isLoading = true;
  double _imageWidth = 1;
  double _imageHeight = 1;
  double _dotSize = 5.0;

  @override
  void initState() {
    super.initState();
    _loadImage();
    _loadCoordinates();
    _loadComparisonImage();
  }

  Future<void> _loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');

    if (userId != null) {
      final Directory? externalDir = await getExternalStorageDirectory();
      final String dirPath = '${externalDir!.path}/MyAppImages';
      final directory = Directory(dirPath);

      int counter = 1;
      File? imageFile;
      while (true) {
        final filePath =
            '$dirPath/$userId${counter == 1 ? '' : '_$counter'}.jpg';
        final file = File(filePath);
        if (await file.exists()) {
          imageFile = file;
        } else {
          break;
        }
        counter++;
      }

      if (imageFile != null) {
        final decodedImage = await decodeImageFromList(imageFile.readAsBytesSync());
        setState(() {
          _imageFile = imageFile;
          _imageWidth = decodedImage.width.toDouble();
          _imageHeight = decodedImage.height.toDouble();
        });
      }
    }
  }

  Future<void> _loadComparisonImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');

    if (userId != null) {
      final directory = await getExternalStorageDirectory();
      final dirPath = '${directory!.path}/MyAppImages';
      final filePath = '$dirPath/${userId}_comparison.jpg';

      final file = File(filePath);

      if (await file.exists()) {
        setState(() {
          _comparisonImageFile = file;
        });
      }
    }
  }

  Future<void> _loadCoordinates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');

    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('The user ID cannot be found. Please log in again.')),
      );
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final directory = await getExternalStorageDirectory();
    final dirPath = '${directory!.path}/MyAppImages/Landmarks';
    final filePath = '$dirPath/$userId.txt';

    final file = File(filePath);

    if (await file.exists()) {
      final contents = await file.readAsLines();
      String currentType = '';

      for (var line in contents) {
        final trimmedLine = line.trim();

        if (trimmedLine.startsWith('Type: ')) {
          final type = trimmedLine.substring(6).trim();
          if (_coordinatesMap.containsKey(type)) {
            currentType = type;
            print('Found type: $currentType');
          } else {
            print('Unknown type found: $type');
            currentType = '';
          }
        } else if (currentType.isNotEmpty) {
          try {
            final parts = trimmedLine.split(',');
            if (parts.length == 2) {
              final xPart = parts[0].split(':');
              final yPart = parts[1].split(':');
              if (xPart.length == 2 && yPart.length == 2) {
                final x = double.parse(xPart[1].trim());
                final y = double.parse(yPart[1].trim());
                _coordinatesMap[currentType]?.add(Offset(x, y));
                print('Added coordinate: ($x, $y) to $currentType');
              }
            }
          } catch (e) {
            print('Error parsing line: $line');
          }
        } else {
          print('No valid type found for line: $line');
        }
      }
      setState(() {
        _isLoading = false;
      });
    } else {
      print('File does not exist: $filePath');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Landmark Visualization'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _coordinatesMap.values.every((list) => list.isEmpty)
            ? Text('No coordinates found.')
            : Column(
          children: [
            Expanded(
              flex: 3,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final width = 465.0;
                  final height = 500.0;
                  final scaleX = width / _imageWidth;
                  final scaleY = height / _imageHeight;

                  return Stack(
                    children: [
                      if (_imageFile != null)
                        Image.file(
                          _imageFile!,
                          width: width,
                          height: height,
                          fit: BoxFit.cover,
                        ),
                      CustomPaint(
                        size: Size(width, height),
                        painter: CoordinatePainter(
                            _coordinatesMap, scaleX * 0.88, scaleY, _dotSize),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 1,
              child: _comparisonImageFile != null
                  ? Image.file(
                _comparisonImageFile!,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              )
                  : Center(
                child: Text('No comparison image found.'),
              ),
            ),
            Slider(
              value: _dotSize,
              min: 1.0,
              max: 10.0,
              divisions: 9,
              label: _dotSize.round().toString(),
              onChanged: (value) {
                setState(() {
                  _dotSize = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CoordinatePainter extends CustomPainter {
  final Map<String, List<Offset>> coordinatesMap;
  final double scaleX;
  final double scaleY;
  final double dotSize;

  CoordinatePainter(this.coordinatesMap, this.scaleX, this.scaleY, this.dotSize);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = dotSize
      ..style = PaintingStyle.fill;

    coordinatesMap.forEach((type, coordinates) {
      switch (type) {
        case 'landmarks':
          paint.color = Colors.blue;
          break;
        case 'face':
          paint.color = Colors.red;
          break;
        case 'leftEyebrowTop':
          paint.color = Colors.green;
          break;
        case 'leftEyebrowBottom':
          paint.color = Colors.lightGreen;
          break;
        case 'rightEyebrowTop':
          paint.color = Colors.orange;
          break;
        case 'rightEyebrowBottom':
          paint.color = Colors.deepOrange;
          break;
        case 'leftEye':
          paint.color = Colors.purple;
          break;
        case 'rightEye':
          paint.color = Colors.deepPurple;
          break;
        case 'upperLipTop':
          paint.color = Colors.pink;
          break;
        case 'upperLipBottom':
          paint.color = Colors.pinkAccent;
          break;
        case 'lowerLipTop':
          paint.color = Colors.brown;
          break;
        case 'lowerLipBottom':
          paint.color = Colors.brown.shade700;
          break;
        case 'noseBridge':
          paint.color = Colors.yellow;
          break;
        case 'noseBottom':
          paint.color = Colors.yellowAccent;
          break;
        case 'leftCheek':
          paint.color = Colors.cyan;
          break;
        case 'rightCheek':
          paint.color = Colors.cyanAccent;
          break;
        default:
          paint.color = Colors.black;
      }

      for (final coordinate in coordinates) {
        final scaledOffset = Offset(coordinate.dx * scaleX, coordinate.dy * scaleY);
        canvas.drawCircle(scaledOffset, dotSize / 4, paint);
      }
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
