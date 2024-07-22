import 'package:flutter/material.dart';
import 'package:SmileHelper/main/main_stage.dart'; // MainHome import
import 'package:SmileHelper/shop/shop_main.dart'; // ShopMain import
import 'package:SmileHelper/main/mypage.dart'; // MyPage import
import 'package:SmileHelper/css/screen.dart'; // BaseScreen import

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isSoundOn = true;
  String language = 'English';
  String version = '1.0.0';
  double _androidImageHeight = 80; // 초기 이미지 높이 설정

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return BaseScreen(
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 364,
            constraints: BoxConstraints(
              minHeight: height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
            ),
            decoration: BoxDecoration(
              color: Colors.white, // 배경색을 흰색으로 변경
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Information',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // 흰색 텍스트
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // 중앙 배치
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildSettingItem(
                          'My Page',
                          Icons.person,
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyPage()),
                            );
                          },
                        ),
                        _buildSettingItem(
                          'Sound ${isSoundOn ? "On" : "Off"}',
                          isSoundOn ? Icons.volume_up : Icons.volume_off,
                              () {
                            setState(() {
                              isSoundOn = !isSoundOn;
                            });
                          },
                        ),
                        _buildSettingItem(
                          'Language: $language',
                          Icons.language,
                              () {
                            _showLanguageDialog();
                          },
                        ),
                        _buildSettingItem(
                          'Version: $version',
                          Icons.info,
                          null,
                        ),
                        SizedBox(height: 20), // 간격 조정
                        Image.asset(
                          'assets/images/android.jpg', // Android 아이콘 경로
                          height: _androidImageHeight,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // 간격 조정
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: buildShimmerButton(
                            context,
                            'Shop',
                                () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShopMain()),
                              );
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF8B4513),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              textStyle: TextStyle(fontSize: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(
                              'Shop',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: buildShimmerButton(
                            context,
                            'Main',
                                () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MainHome()),
                              );
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF8B4513),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              textStyle: TextStyle(fontSize: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(
                              'Main',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem(String title, IconData icon, VoidCallback? onTap) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black26),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget buildShimmerButton(BuildContext context, String text, VoidCallback onPressed, {required Text child, required ButtonStyle style}) {
    return Container(
      height: 50, // 버튼 높이 설정
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
            backgroundColor: Color(0xFF8B4513), // 버튼 배경색을 흰색으로 설정
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // 버튼을 둥글게 설정
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // 패딩 조정
        ),
        onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Language'),
          content: Container(
            height: 100,
            child: Column(
              children: [
                RadioListTile(
                  title: Text('English'),
                  value: 'English',
                  groupValue: language,
                  onChanged: (value) {
                    setState(() {
                      language = value.toString();
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
