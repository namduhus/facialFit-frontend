import 'package:flutter/material.dart';

class BtnPop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      left: 378,
      top: 31,
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
          alignment: Alignment.center,
          child: Image.asset("assets/images/POP.png"),
        ),
      ),
    );
  }
}
