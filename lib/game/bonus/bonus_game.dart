import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:SmileHelper/game/result/stageclear1.dart';
import 'package:SmileHelper/game/result/stagefail1.dart';

class BonusGame extends StatefulWidget {
  @override
  _BonusGameState createState() => _BonusGameState();
}

class _BonusGameState extends State<BonusGame> {
  final List<String> emotions = ['anger', 'happy', 'neutral', 'panic', 'sad'];
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
          if (selectedEmotion == result) {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Bonus Mode'),
        backgroundColor: Color(0xFF207F66),
      ),
      body: Container(
        color: Color(0xFF207F66),
        child: Center(
          child: Container(
            width: 424,
            height: 805,
            decoration: BoxDecoration(
              color: Color(0xFF48AA7B),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    width: 300,
                    height: 400,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: AspectRatio(
                        aspectRatio: 3 / 4,
                        child: CameraPreview(_cameraController),
                      ),
                    ),
                  ),
              ],
            ),
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