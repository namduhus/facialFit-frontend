import 'package:flutter/material.dart';
import 'package:iccas_test1/settings/select.dart';

class btnSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      left: 411,
      top: 16,
      child: InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => Setting())),
        child: Container(
          width: 38,
          height: 41,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/wSetting.png"))),
        ),
      ),
    );
  }
}
