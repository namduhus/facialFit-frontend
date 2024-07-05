import 'package:flutter/src/material/progress_indicator.dart';
import 'package:flutter/material.dart';

class Progressbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CircularProgressIndicator(
      backgroundColor: Color(0xFFFAF9E0),
      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF207F66)),
      semanticsLabel: "semanticLabel",
      semanticsValue: "semanticValue",
      strokeCap: StrokeCap.round,
    ));
  }
}
