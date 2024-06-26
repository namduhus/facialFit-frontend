import 'package:flutter/material.dart';

import 'init.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          //resizeToAvoidBottomInset: false,
          //appBar: AppBar(),
          // 로그인/회원가입 화면 실행
          body: Expanded(
        child: ListView(
          children: [
            Appinit(),
          ],
        ),
      )),

      /* body: ListView( children: [Appinit()], ) */
      // 까지
    );
  }
}
