import 'package:SmileHelper/game/story/story_stage.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:SmileHelper/css/screen.dart'; // BaseScreen import

class Prolog extends StatefulWidget {
  @override
  _PrologPageState createState() => _PrologPageState();
}

class _PrologPageState extends State<Prolog> {
  late VideoPlayerController _controller;
  double _volume = 10; // 초기 볼륨 설정

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video2.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
    _controller.setLooping(false);
    _controller.setVolume(_volume); // 초기 볼륨 설정
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToStage() {
    _controller.pause(); // 동영상 일시정지
    _controller.dispose(); // 동영상 종료

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StoryStage()), // StagePage로 대체
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Stack(
        children: [
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
                : CircularProgressIndicator(),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: _navigateToStage,
              child: Text('Stage'),
            ),
          ),
        ],
      ),
    );
  }
}
