import 'package:flutter/material.dart';
import 'package:iccas_test1/etc/statistics.dart';

class btnStatistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      left: 327,
      top: 755,
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Statistics())),
        child: Container(
          width: 107,
          height: 49,
          decoration: ShapeDecoration(
            color: Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90),
            ),
          ),
          child: Positioned(
            left: 346,
            top: 768,
            child: SizedBox(
              width: 69,
              height: 18,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'statistics',
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
          ),
        ),
      ),
    );
  }
}
