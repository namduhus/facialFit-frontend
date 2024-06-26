import 'package:flutter/material.dart';

import 'package:iccas_test1/main/stage.dart';

class EndingSuccess extends StatelessWidget {
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
                          left: 32,
                          top: 124,
                          child: Container(
                            width: 411,
                            height: 473,
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
                          left: 122,
                          top: 239,
                          child: Container(
                            width: 205,
                            height: 242,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://via.placeholder.com/205x242"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 53,
                          top: 500,
                          child: SizedBox(
                            width: 386.82,
                            height: 37,
                            child: Text(
                              'You finished All round!',
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
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainStage())),
                          child: Container(
                            width: 197,
                            height: 86,
                            decoration: ShapeDecoration(
                              color: Color(0xFF909FD5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Positioned(
                                left: 73,
                                top: 699,
                                child: Text(
                                  'Home',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 35,
                                    fontFamily: 'ABeeZee',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 273,
                          top: 699,
                          child: Text(
                            'Epilogue',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
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
