import 'package:flutter/material.dart';

class Story3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                        left: 19,
                        top: 21,
                        child: Container(
                          width: 436,
                          height: 797,
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
                        left: 81,
                        top: 346,
                        child: Container(width: 99, height: 88),
                      ),
                      Positioned(
                        left: 428,
                        top: 746,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(1.57),
                          child: Container(
                            width: 49,
                            height: 44,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFF3F3),
                              shape: StarBorder.polygon(
                                side: BorderSide(
                                    width: 1, color: Color(0xFF6B6060)),
                                sides: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 31,
                        top: 192,
                        child: Container(
                          width: 411,
                          height: 527,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFAF9E0),
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
                        left: 45,
                        top: 623,
                        child: SizedBox(
                          width: 387,
                          height: 61,
                          child: Text(
                            '그로인해 Mr.Brian은 동네에서 웃지 않고 무뚝뚝하기로 유명하다',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'ABeeZee',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 99,
                        top: 56,
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
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 41,
                top: 203,
                child: Container(
                  width: 388,
                  height: 307,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage("https://via.placeholder.com/388x307"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(41),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
