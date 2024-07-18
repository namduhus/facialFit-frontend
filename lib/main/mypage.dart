import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:SmileHelper/shop/shop_main.dart';
import 'package:SmileHelper/main/main_stage.dart'; // MainStage import
import 'package:SmileHelper/css/screen.dart'; // BaseScreen import
import 'package:SmileHelper/main/statistics.dart'; // Statistics import

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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
    return BaseScreen(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text(
                'My Page',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoItem('ID: $id'),
                    _buildInfoItem('Nickname: $nickname'),
                    _buildInfoItem('Age: $age'),
                    _buildInfoItem('Role: $role'),
                    _buildInfoItem('Coin: $coin'),
                    _buildInfoItem('Health Area: $healthArea'),
                    _buildInfoItem('Severity Level: $severityLevel'),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ShopMain()),
                          );
                        },
                        child: Text('Shop'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainHome()),
                          );
                        },
                        child: Text('Main'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => StatisticsPage()),
                          );
                        },
                        child: Text('Statistics'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String text) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
