import 'package:flutter/material.dart';
import 'package:SmileHelper/main/stage.dart';
import 'package:SmileHelper/main/statefullStage.dart';

class BtnHome extends StatelessWidget {
  const BtnHome({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      left: 187,
      top: 755,
      child: InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => StatefullMainStage())),
        child: Container(
            width: 106,
            height: 49,
            decoration: ShapeDecoration(
              color: Color(0xFFD9D9D9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90),
              ),
            ),
            child: Positioned(
              left: 217,
              top: 768,
              child: SizedBox(
                width: 44,
                height: 24,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'home',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
