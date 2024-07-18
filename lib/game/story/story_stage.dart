import 'package:SmileHelper/game/controller/stage_controller.dart';
import 'package:flutter/material.dart';
import 'package:SmileHelper/main/main_stage.dart'; // MainHome import
import 'package:SmileHelper/game/story/start.dart'; // StartPage import
import 'package:SmileHelper/css/screen.dart'; // BaseScreen import

import 'package:SmileHelper/game/story/start.dart';
import 'package:get/get.dart'; // StartPage import

class StoryStage extends StatefulWidget {
  @override
  _StoryStageState createState() => _StoryStageState();
}

class _StoryStageState extends State<StoryStage> {
  final StageController stageController = Get.put(StageController());
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
            Positioned(
              left: 0,
              top: screenHeight * 0.71,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.192,
                child: Center(
                  child: Image.asset(
                    'assets/images/weding.png', // 중앙 이미지 경로
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: screenWidth * 0.2, // 원하는 너비 설정
                child: ListView.builder(
                  itemCount: 10, // 충분한 이미지 수 설정
                  itemBuilder: (context, index) {
                    return Image.asset(
                      'assets/images/forest.png',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: screenWidth * 0.2, // 원하는 너비 설정
                child: ListView.builder(
                  itemCount: 10, // 충분한 이미지 수 설정
                  itemBuilder: (context, index) {
                    return Image.asset(
                      'assets/images/forest.png',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.25,
              top: screenHeight * 0.1,
              child: ElevatedButton(
                onPressed: () {
                  stageController.setStage(1);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StoryStart(stage: 'Stage 1')),
                  );
                },
                child: Text('Stage 1'),
              ),
            ),
            Positioned(
              right: screenWidth * 0.25,
              top: screenHeight * 0.22,
              child: ElevatedButton(
                onPressed: () {
                  stageController.setStage(2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StoryStart(stage: 'Stage 2')),
                  );
                },
                child: Text('Stage 2'),
              ),
            ),
            Positioned(
              left: screenWidth * 0.25,
              top: screenHeight * 0.33,
              child: ElevatedButton(
                onPressed: () {
                  stageController.setStage(3);
                  Get.to(StoryStart(stage: 'stage 3'));
                },
                child: Text('Stage 3'),
              ),
            ),
            Positioned(
              right: screenWidth * 0.25,
              top: screenHeight * 0.43,
              child: ElevatedButton(
                onPressed: () {
                  stageController.setStage(4);
                  Get.to(StoryStart(stage: 'stage 4'));
                },
                child: Text('Stage 4'),
              ),
            ),
            Positioned(
              left: screenWidth * 0.23,
              top: screenHeight * 0.51,
              child: ElevatedButton(
                onPressed: () {
                  stageController.setStage(5);
                  Get.to(StoryStart(stage: 'stage 5'));
                },
                child: Text('Stage 5'),
              ),
            ),
            Positioned(
              top: screenHeight * 0.62,
              left: screenWidth * 0.5 - 50, // 중앙 정렬
              child: ElevatedButton(
                onPressed: () {
                  stageController.setStage(6);
                  Get.to(StoryStart(stage: 'stage 6'));
                },
                child: Text('Stage 6'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
