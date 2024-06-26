import 'package:flutter/material.dart';
import 'package:iccas_test1/main/stage.dart';

class GoHome extends StatelessWidget {
  BuildContext? get context => null;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: GoHome());
  }

  GoHome({super.key}) {
    () => Navigator.push(
        context!, MaterialPageRoute(builder: (context) => MainStage()));
  }
}
