import 'package:flutter/material.dart';
import 'package:SmileHelper/etc/stop.dart';

class BtnStop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      left: 378,
      top: 31,
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Stop())),
        child: Container(
          alignment: Alignment.center,
          child: Image.asset("assets/images/stop.png"),
        ),
      ),
    );
  }
}
