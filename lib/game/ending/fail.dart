import 'package:flutter/material.dart';

class EndingFail extends StatelessWidget {
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
                          left: 81,
                          top: 496,
                          child: SizedBox(
                            width: 332,
                            height: 33,
                            child: Text(
                              'It’s okay. Try Again.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 34.66,
                                fontFamily: 'ABeeZee',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 163,
                          top: 699,
                          child: Text(
                            'Home',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 45.14,
                              fontFamily: 'ABeeZee',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 182,
                          top: 361,
                          child: Text(
                            'Retry',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 45.14,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
