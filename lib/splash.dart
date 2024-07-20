import 'package:flutter/material.dart';
import 'dart:async'; // Timer를 사용하기 위해 추가
import 'login_main.dart'; // LoginPage import

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // duration 설정 (2200ms)
    Timer(Duration(milliseconds: 2200), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginMain()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8B4513),
      body: Center(
        child: Image.asset(
          'assets/images/splash.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
