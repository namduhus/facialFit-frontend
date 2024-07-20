import 'package:SmileHelper/main/main_stage.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:SmileHelper/game/story/story_stage.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class StageFail5 extends StatefulWidget {
  final String result;

  StageFail5({required this.result});

  @override
  _StageFail5State createState() => _StageFail5State();
}

class _StageFail5State extends State<StageFail5> {
  late AudioPlayer _audioPlayer;
  late String result;

  @override
  void initState() {
    super.initState();
    result = widget.result;
    _audioPlayer = AudioPlayer();
    _playSound();
  }

  Future<void> _playSound() async {
    await _audioPlayer.play(AssetSource('fail.mp3'), volume: 15.0);
    Future.delayed(Duration(seconds: 2), () {
      _audioPlayer.stop();
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Widget buildShimmerButton(BuildContext context, String text, Widget page) {
    return Container(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Color(0xFF8B4513),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        ),
        onPressed: () {
          Get.to(page);
        },
        child: Shimmer.fromColors(
          baseColor: Colors.black,
          highlightColor: Color(0xFFD2691E),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8B4513),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/images/Logo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF8B4513),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFF8B4513),
              ),
              child: Text(
                '5 Stage...', // Changed to 2 Stage
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/Game Over.png',
                    fit: BoxFit.contain,
                    width: 350,
                    height: 150,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Result: $result',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15),
                  Image.asset(
                    'assets/images/sad1.png',
                    fit: BoxFit.contain,
                    width: 500,
                    height: 150,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildShimmerButton(context, 'Stage', StoryStage()),
                SizedBox(width: 20),
                buildShimmerButton(context, 'Home', MainHome()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}