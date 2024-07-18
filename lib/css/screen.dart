// MainHome 제외 나머지 UI 전용 BaseScreen
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;

  BaseScreen({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 뒤로 가기 버튼 없애기
        title: Image.asset(
          'assets/images/Smile-Helper.png',
          fit: BoxFit.contain,
          height: 32,
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF8B4513), // AppBar 갈색으로 설정
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF8B4513), Color(0xFFF5DEB3)], // 갈색에서 밀짚색으로
          ),
        ),
        child: child,
      ),
    );
  }
}
