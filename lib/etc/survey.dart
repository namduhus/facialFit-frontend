import 'package:flutter/material.dart';

class Survey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: 478,
            height: 841,
            child: Stack(
              children: [
                Container(
                  width: 478,
                  height: 841,
                  decoration: BoxDecoration(color: Color(0xFF207F66)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
