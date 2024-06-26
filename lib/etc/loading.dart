import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
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
                        top: 15,
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
                        left: 42,
                        top: 747,
                        child: SizedBox(
                          width: 107,
                          height: 49,
                          child: FlutterLogo(),
                        ),
                      ),
                      Positioned(
                        left: 149,
                        top: 177,
                        child: Opacity(
                          opacity: 0.75,
                          child: Container(
                            width: 185,
                            height: 168,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://via.placeholder.com/185x168"),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(77.50),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 147,
                        top: 166,
                        child: Opacity(
                          opacity: 0.75,
                          child: Container(
                            width: 190,
                            height: 190,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://via.placeholder.com/190x190"),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 68,
                top: 394,
                child: Container(
                  width: 341,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFAF9E0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 155,
                top: 442,
                child: Text(
                  'Loading...',
                  style: TextStyle(
                    color: Color(0xFFFFEFEF),
                    fontSize: 35.84,
                    fontFamily: 'ABeeZee',
                    fontWeight: FontWeight.w400,
                    height: 0,
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
