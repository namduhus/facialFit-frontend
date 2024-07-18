import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:SmileHelper/game/result/stageclear1.dart';
import 'package:SmileHelper/game/result/stagefail1.dart';
import 'package:SmileHelper/css/screen.dart'; // BaseScreen import

class BonusGame extends StatefulWidget {
  @override
  _BonusGameState createState() => _BonusGameState();
}

class _BonusGameState extends State<BonusGame> {
  final List<String> emotions = ['happy', 'sad', 'angry', 'neutral', 'panic'];
  late String selectedEmotion;
  int countDown = 3;
  bool isCapturing = false;
  String result = '';
  late CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    selectedEmotion = emotions[Random().nextInt(emotions.length)];
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(cameras[1], ResolutionPreset.medium);
    await _cameraController.initialize();
    if (!mounted) return;
    setState(() {});
  }

  void startGame() {
    setState(() {
      isCapturing = true;
    });
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (countDown > 0) {
        setState(() {
          countDown--;
        });
      } else {
        timer.cancel();
        captureAndAnalyze();
      }
    });
  }

  Future<void> captureAndAnalyze() async {
    setState(() {
      result = 'Capturing...';
    });
    final image = await _cameraController.takePicture();
    setState(() {
      result = 'Capture complete. Analyzing...';
    });

    // 이미지를 MultipartFile로 변환
    var request = http.MultipartRequest('POST', Uri.parse('http://203.241.246.109:10005/predict'));
    request.files.add(await http.MultipartFile.fromPath('file', image.path));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var data = json.decode(responseData);
        setState(() {
          result = data['emotion'];
        });
        Timer(Duration(seconds: 1), () {
          if (result == selectedEmotion) {
            Get.off(() => StageClear());
          } else {
            Get.off(() => StageFail());
          }
        });
      } else {
        setState(() {
          result = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        result = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: Container(
          width: 424,
          height: 805,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bonus Game!!!',
                style: TextStyle(fontSize: 34, color: Color(0xFFFFF3F3)),
              ),
              Text(
                'Make a $selectedEmotion face',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 20),
              if (!isCapturing)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFAF9E0),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  onPressed: startGame,
                  child: Text('Start', style: TextStyle(color: Colors.black)),
                )
              else if (countDown > 0)
                Text('$countDown', style: TextStyle(fontSize: 48, color: Colors.white))
              else
                Text(result, style: TextStyle(fontSize: 24, color: Colors.white)),
              SizedBox(height: 20),
              if (_cameraController.value.isInitialized)
                Container(
                  width: 320,
                  height: 480,
                  child: CameraPreview(_cameraController),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }
}
