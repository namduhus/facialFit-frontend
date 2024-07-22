import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:SmileHelper/shop/shop_main.dart';
import 'package:SmileHelper/main/main_stage.dart'; // MainStage import
import 'package:SmileHelper/css/screen.dart'; // BaseScreen import
import 'package:shimmer/shimmer.dart'; // Shimmer effect
import 'package:SmileHelper/main/statistics.dart'; // Statistics import

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  String id = '';
  String nickname = '';
  int age = 0;
  String role = '';
  int coin = 0;
  String healthArea = '';
  String severityLevel = '';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');

    final response = await http.get(
      Uri.parse('http://34.47.88.29:8082/api/user/all'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      setState(() {
        id = jsonResponse['id'];
        nickname = jsonResponse['nickname'];
        age = jsonResponse['age'];
        role = jsonResponse['role'];
        coin = jsonResponse['coin'];
        healthArea = jsonResponse['healthArea'];
        severityLevel = jsonResponse['severityLevel'];
      });
    } else {
      print('Failed to load user data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BaseScreen(
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 375,
            constraints: BoxConstraints(
              maxHeight: height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom - 63, // 적절한 최대 높이 설정
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
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildHeader(width, height),
                  _buildUserInfo(width, height),
                  _buildButtons(width, height),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double width, double height) {
    return Container(
      padding: EdgeInsets.all(height * 0.02),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFF8B4513), // 배경색을 갈색으로 변경
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.account_circle,
            size: height * 0.07,
            color: Colors.white,
          ),
          SizedBox(height: height * 0.011),
          Text(
            'PlayerCard',
            style: TextStyle(
              fontSize: height * 0.03,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(double width, double height) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoItem('Player ID', id),
          _buildInfoItem('Username', nickname),
          _buildInfoItem('Age', age.toString()),
          _buildInfoItem('Role', role),
          _buildInfoItem('Coins', coin.toString()),
          _buildInfoItem('Health Area', healthArea),
          _buildInfoItem('Severity Level', severityLevel),
        ],
      ),
    );
  }

  Widget _buildButtons(double width, double height) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildShimmerButton('Shop', ShopMain(), width, height),
          _buildShimmerButton('Main', MainHome(), width, height),
          _buildShimmerButton('Stats', StatisticsPage(), width, height),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF8B4513)),
          ),
          Shimmer.fromColors(
            baseColor: Color(0xFF8B4513),
            highlightColor: Color(0xFFD2691E),
            child: Text(
              value,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerButton(String text, Widget page, double width, double height) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF8B4513), // 버튼 배경색을 흰색으로 설정
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // 버튼을 둥글게 설정
            ),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5), // 패딩 조정
          ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
    );
  }
}
