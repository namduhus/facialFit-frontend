import 'package:flutter/material.dart';
import 'package:SmileHelper/login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Register extends StatelessWidget {
  Register({super.key});
  final idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            width: 458,
            height: 841,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: SizedBox(
                    width: 458,
                    height: 841,
                    child: Stack(
                      children: [
                        Positioned(
                          left: -5,
                          top: 0,
                          child: Container(
                            width: 456,
                            height: 841,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFF207F66),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: Colors.black
                                      .withOpacity(0.20000000298023224),
                                ),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 18,
                                  top: 17,
                                  child: Container(
                                    width: 424,
                                    height: 805,
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
                                  left: 24,
                                  top: 139,
                                  child: Container(
                                    width: 375,
                                    height: 54,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFD9D9D9),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller: idController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Enter your ID',
                                        contentPadding: EdgeInsets.only(
                                            left: 20),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your ID';
                                        }
                                        // 추가적인 ID 유효성 검사 로직
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 30,
                                  top: 346,
                                  child: Container(
                                    width: 375,
                                    height: 54,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFD9D9D9),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Enter your PW',
                                        contentPadding: EdgeInsets.only(
                                            left: 20),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your PW';
                                        }
                                        // 추가적인 PW 유효성 검사 로직
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 24,
                                  top: 447,
                                  child: Container(
                                    width: 375,
                                    height: 54,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFD9D9D9),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Check your PW',
                                        contentPadding: EdgeInsets.only(
                                            left: 20),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please check your PW';
                                        }
                                        // 추가적인 PW 확인 유효성 검사 로직
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 30,
                                  top: 240,
                                  child: Container(
                                    width: 375,
                                    height: 54,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFD9D9D9),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Enter your username',
                                        contentPadding: EdgeInsets.only(
                                            left: 20),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your username';
                                        }
                                        // 추가적인 username 유효성 검사 로직
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 24,
                                  top: 104,
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
                                  left: 30,
                                  top: 311,
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
                                  left: 24,
                                  top: 210,
                                  child: SizedBox(
                                    width: 216,
                                    height: 22,
                                    child: Text(
                                      'Username',
                                      style: TextStyle(
                                        color: Color(0xFFFFFCFC),
                                        fontSize: 20,
                                        fontFamily: 'ABeeZee',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 30,
                                  top: 417,
                                  child: SizedBox(
                                    width: 216,
                                    height: 22,
                                    child: Text(
                                      'Pass Word Check',
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
                                  left: 24,
                                  top: 521,
                                  child: SizedBox(
                                    width: 311,
                                    height: 22,
                                    child: Text(
                                      'consent to personal information',
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
                                  left: 170,
                                  top: 560,
                                  child: SizedBox(
                                    width: 120,
                                    height: 30,
                                    child: Text(
                                      '<설문조사>',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'ABeeZee',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),

                                //  REGISTER
                                Positioned(
                                  left: 124,
                                  top: 707,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                      },
                                      child: Container(
                                        width: 197,
                                        height: 86,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF8F9FD4),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(15),
                                          ),
                                        ),
                                        child: Align(
                                            alignment: Alignment.center,
                                          child: Text(
                                            'Register',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                              fontFamily: 'ABeeZee',
                                              fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                  ),
                                      ),

                                //////////////////////////// REGISTER ////////////////////////////

                                //////////////////////////// 설문조사 /////////////////////////////
                                Positioned(
                                  left: 180,
                                  top: 611,

                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/survey');
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF8F9FD4),
                                        borderRadius: BorderRadius.circular(5),
                                    ),
                                      child: Align(
                                        alignment: Alignment.center,
                                      child: Text(
                                        '설문조사하기',
                                        textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: 'ABeeZee',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //////////////////////  설문조사 하기 ///////////////////////////////

                                //////////////////////////////  중복확인 ////////////////////////////
                                Positioned(
                                  left: 342,
                                  top: 108,
                                  child: InkWell(
                                    onTap: () async {
                                      String userId = idController.text;
                                      bool isDuplicate = await checkIdDuplicate(
                                          userId);
                                      if (isDuplicate) {
                                        // 중복일 경우 사용자에게 알림
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                            content: Text(
                                                'ID is already taken')));
                                      } else {
                                        // 중복이 아닐 경우 사용자에게 알림
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                            content: Text('ID is available')));
                                      }
                                    },
                                    child: Container(
                                        width: 57,
                                        height: 24,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFD9D9D9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(50),
                                          ),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Positioned(
                                            left: 351,
                                            top: 114,
                                            child: Text(
                                              '중복확인',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10.16,
                                                fontFamily: 'ABeeZee',
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                ),

                                //////////////////////  화면 위의 REGISTER 글자  //////////////////////
                                Positioned(
                                  left: 130,
                                  top: 17,
                                  child: SizedBox(
                                    width: 196,
                                    height: 67,
                                    child: Text(
                                      'Register',
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

                                /////////////////////////  개인정보 사용 허락 체크박스  ///////////////////////
                                Positioned(
                                  left: 351,
                                  top: 510,
                                  child: Checkbox(
                                    value: false,
                                    activeColor: Colors.blue,
                                    checkColor: Colors.green,
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.green.withOpacity(0.2)),
                                    splashRadius: 24,
                                    materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                    fillColor: const MaterialStatePropertyAll(
                                        Colors.grey),
                                    onChanged: (bool? value) {
                                      // 선택되었을 때
                                      // 약관 확인 페이지로 이동 후 다시 돌아왔을 때 체크
                                      value;
                                    },
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
          ),
        ],
      ),
    );
  }
}
////////백엔드 API////////////
  Future<bool> checkIdDuplicate(String userId) async {
    final Uri url = Uri.parse(
        'https://yourbackend.com/api/join/join'); // 실제 백엔드 서버 URL로 변경 필요
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userId': userId,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['isDuplicate'];
    } else {
      // 오류 처리 또는 예외 발생
      throw Exception('Failed to check ID duplication');
    }
  }
