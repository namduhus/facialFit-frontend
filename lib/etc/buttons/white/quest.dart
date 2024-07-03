import 'package:flutter/material.dart';

import 'package:iccas_test1/etc/quest.dart';

class btnQuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      left: 306,
      top: 17,
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Quest())),
        child: Container(
          width: 48,
          height: 41,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/wParchment.png"),
              //image: NetworkImage("https://via.placeholder.com/48x41"),fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
