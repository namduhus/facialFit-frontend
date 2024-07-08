import 'package:flutter/material.dart';
import 'TestFiles/login.dart';
import 'TestFiles/register2.dart';

class Appinit extends StatelessWidget {
  const Appinit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
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

                          //   로그인
                          Positioned(
                            left: 139,
                            top: 482,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: Container(
                                width: 197,
                                height: 86,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF909FD5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Positioned(
                                  left: 198,
                                  top: 504,
                                  child: SizedBox(
                                    width: 103,
                                    height: 43,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
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
                            ),
                          ),

                          /*
                          Positioned(
                            left: 198,
                            top: 504,
                            child: SizedBox(
                              width: 103,
                              height: 43,
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontFamily: 'ABeeZee',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
            */
                          //    회원가입
                          Positioned(
                            left: 141,
                            top: 248,
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register2()));
                                },
                                child: Container(
                                  width: 197,
                                  height: 86,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF8F9FD4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Positioned(
                                        left: 170,
                                        top: 269,
                                        child: SizedBox(
                                          width: 139,
                                          height: 45,
                                          child: Text(
                                            'Regitser',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                              fontFamily: 'ABeeZee',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      )),
                                )),
                          ),

                          /*
                          Positioned(
                            left: 170,
                            top: 269,
                            child: SizedBox(
                              width: 139,
                              height: 45,
                              child: Text(
                                'Regitser',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontFamily: 'ABeeZee',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          */

                          Positioned(
                            left: 89,
                            top: 40,
                            child: SizedBox(
                              width: 339,
                              height: 60,
                              child: Text(
                                'Smile-Helper',
                                style: TextStyle(
                                  color: Color(0xFFFFF3F3),
                                  fontSize: 51.53,
                                  fontFamily: 'ABeeZee',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
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
      ],
    );
  }
}
