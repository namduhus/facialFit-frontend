// MainHome 전용 BaseScreen
import 'package:flutter/material.dart';
import 'dart:io';

class BaseScreen_home extends StatefulWidget {
  final Widget child;
  final File? imageFile;

  BaseScreen_home({required this.child, this.imageFile});

  @override
  _BaseScreenhomeState createState() => _BaseScreenhomeState();
}

class _BaseScreenhomeState extends State<BaseScreen_home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 뒤로 가기 버튼 없애기
        title: Image.asset(
          'assets/images/Smile-Helper.png',
          fit: BoxFit.contain,
          height: 32,
        ),
        centerTitle: true,
        actions: [
          if (widget.imageFile != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(
                widget.imageFile!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
        ],
        backgroundColor: Color(0xFF87CEEB), // AppBar 하늘색으로 설정
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF87CEEB), Color(0xFFFFFFFF)], // 하늘색에서 흰색으로
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
