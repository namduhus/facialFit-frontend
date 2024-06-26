import 'package:flutter/material.dart';
import 'package:iccas_test1/main/stage.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            child: SizedBox(
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
                            left: 35,
                            top: 296,
                            child: SizedBox(
                              width: 266,
                              height: 27,
                              child: Text(
                                'ID',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'ABeeZee',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 35,
                            top: 331,
                            child: Container(
                              width: 375,
                              height: 54,
                              decoration: ShapeDecoration(
                                color: Color(0xFFD9D9D9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 35,
                            top: 429,
                            child: SizedBox(
                              width: 266,
                              height: 27,
                              child: Text(
                                'Pass Word',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'ABeeZee',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 35,
                            top: 464,
                            child: Container(
                              width: 375,
                              height: 54,
                              decoration: ShapeDecoration(
                                color: Color(0xFFD9D9D9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),

                          //////// Login 버튼 ////////

                          Positioned(
                            left: 141,
                            top: 677,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainStage()));
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
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Positioned(
                                      left: 188,
                                      top: 699,
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
                                    )),
                              ),
                            ),
                          ),

                          /////////// 비밀번호 찾기 ////////////

                          Positioned(
                            left: 35,
                            top: 541,
                            child: Text(
                              'Forget your Password',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'ABeeZee',
                                fontWeight: FontWeight.w400,
                                decoration:
                                    TextDecoration.underline, //textDecoration
                                height: 0,
                              ),
                            ),
                          ),

                          ////////// 위에 있는 LOGIN 글자 ///////////
                          Positioned(
                            left: 168,
                            top: 121,
                            child: SizedBox(
                              width: 142,
                              height: 57,
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white, //FFFFF3F3
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
          ),
        ],
      ),
    );
  }
}
