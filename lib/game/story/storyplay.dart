import 'package:SmileHelper/game/camera_view.dart';
import 'package:SmileHelper/global_binding.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:SmileHelper/game/camera_screen.dart';

import 'package:SmileHelper/game/result/stageclear1.dart';

class StoryPlay extends StatelessWidget {
  //final List<CameraDescription>? cameras;

  const StoryPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: 478,
            height: 841,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 478,
                    height: 841,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(color: Color(0xFF207F66)),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 16,
                          top: 19,
                          child: Container(
                            width: 445,
                            height: 804,
                            decoration: ShapeDecoration(
                              color: Color(0xFF48AA7B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                          ),
                        ),

                        Positioned(
                          left: 38,
                          top: 34,
                          child: Text(
                            'Story Mode',
                            style: TextStyle(
                              color: Color(0xFFFFF3F3),
                              fontSize: 51.53,
                              fontFamily: 'ABeeZee',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
/////
                        Positioned(
                          left: 23,
                          top: 107,
                          child: Container(
                            width: 430,
                            height: 705,

                            child: Stack(children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CameraScreen()),
                            ]), ///////////////////////////////////////////
                          ),
                        ),

                        Positioned(
                          left: 165,
                          top: 645,
                          child: Text(
                            '사용자 얼굴',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 165,
                          top: 645,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '123456초',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          left: 400,
                          top: 300,
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StageClear())),
                            child: Transform(
                              transform: Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(0),
                              child: Container(
                                width: 49,
                                height: 44,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF516DFF),
                                  shape: StarBorder.polygon(
                                    side: BorderSide(
                                        width: 1, color: Color(0xFF6B6060)),
                                    sides: 3,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('성공테스트'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
