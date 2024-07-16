import 'package:SmileHelper/game/story/story_stage.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Prolog extends StatefulWidget {
  @override
  _PrologPageState createState() => _PrologPageState();
}

class _PrologPageState extends State<Prolog> {
  late VideoPlayerController _controller;
  double _volume = 10;// 초기 볼륨 설정

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/prolog.mp4')
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 뒤로 가기 버튼 없애기
        title: Image.asset(
          'assets/images/Logo.png', // 로고 이미지 경로
          fit: BoxFit.contain,
          height: 32,
        ),
        centerTitle: true,
        backgroundColor: Colors.white, // AppBar 배경색 흰색으로 설정
      ),
      body: Container(
        color: Color(0xFF207F66), // 배경색 설정
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
      ),
    );
  }
}

