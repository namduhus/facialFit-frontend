import 'package:SmileHelper/game/controller/stage_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SmileHelper/css/screen.dart'; // BaseScreen import

import '../../hardmode/hard_mode_screen.dart'; // Get 패키지 import

class StoryStage extends StatefulWidget {
  @override
  _StoryStageState createState() => _StoryStageState();
}

class _StoryStageState extends State<StoryStage> {
  final StageController stageController = Get.put(StageController());

  Future<void> _navigateToHardMode() async {
    final cameras = await availableCameras();
    Get.to(() => HardModeScreen(cameras: cameras));
  }

  Future<void> _navigateToHardMode2() async {
    final cameras = await availableCameras();
    Get.to(() => HardModeScreen2(cameras: cameras));
  }

  Future<void> _navigateToHardMode3() async {
    final cameras = await availableCameras();
    Get.to(() => HardModeScreen3(cameras: cameras));
  }

  Future<void> _navigateToHardMode4() async {
    final cameras = await availableCameras();
    Get.to(() => HardModeScreen4(cameras: cameras));

  }
  Future<void> _navigateToHardMode5() async {
    final cameras = await availableCameras();
    Get.to(() => HardModeScreen5(cameras: cameras));
  }

  Future<void> _navigateToHardMode6() async {
    final cameras = await availableCameras();
    Get.to(() => HardModeScreen6(cameras: cameras));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BaseScreen(
      child: Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            // 하단 중앙 이미지
            Positioned(
              left: 0,
              top: screenHeight * 0.71,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.192,
                child: Center(
                  child: Image.asset(
                    'assets/images/weding.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            // 왼쪽 이미지 목록
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: screenWidth * 0.2,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      'assets/images/forest.png',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            // 오른쪽 이미지 목록
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: screenWidth * 0.2,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      'assets/images/forest.png',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            // 스테이지 버튼들
            _buildStageButton(screenWidth, screenHeight, 0.25, 0.1, '', 1, 'assets/images/stage1.png', _navigateToHardMode),
            _buildStageButton(screenWidth, screenHeight, 0.50, 0.22, '', 2, 'assets/images/stage2.png', _navigateToHardMode2),
            _buildStageButton(screenWidth, screenHeight, 0.20, 0.33, '', 3, 'assets/images/stage3.png', _navigateToHardMode3),
            _buildStageButton(screenWidth, screenHeight, 0.50, 0.43, '', 4, 'assets/images/stage4.png', _navigateToHardMode4),
            _buildStageButton(screenWidth, screenHeight, 0.20, 0.51, '', 5, 'assets/images/stage5.png', _navigateToHardMode5),
            Positioned(
              top: screenHeight * 0.60,
              left: screenWidth * 0.5 - 50, // 중앙 정렬
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // 버튼의 배경색을 투명하게 설정
                  shadowColor: Colors.transparent, // 그림자를 투명하게 설정
                ),
                onPressed: () {
                  stageController.setStage(6);
                  _navigateToHardMode6();
                },
                child: Image.asset(
                  'assets/images/stage6.png',
                  height: 100, // 이미지 크기를 더 크게 설정
                  width: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 스테이지 버튼을 생성하는 헬퍼 메서드
  Widget _buildStageButton(double screenWidth, double screenHeight, double leftFactor, double topFactor, String text, int stage, String imagePath, Function navigateToStage) {
    return Positioned(
      left: screenWidth * leftFactor,
      top: screenHeight * topFactor,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // 버튼의 배경색을 투명하게 설정
          shadowColor: Colors.transparent, // 그림자를 투명하게 설정
        ),
        onPressed: () {
          stageController.setStage(stage);
          navigateToStage();
        },
        child: Image.asset(
          imagePath,
          height: 100, // 이미지 크기를 더 크게 설정
          width: 100,
        ),
      ),
    );
  }
}
