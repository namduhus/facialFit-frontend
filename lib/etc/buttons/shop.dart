import 'package:flutter/material.dart';
import 'package:SmileHelper/etc/shop.dart';

class btnShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      left: 44,
      top: 755,
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Shop())),
        child: Container(
          width: 107,
          height: 49,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/button.png"),

              //image: NetworkImage("https://via.placeholder.com/182x182"),fit: BoxFit.fill,
            ),
          ) //FlutterLogo(), //왜 플러터 로고?
          ,
          child: Align(
              alignment: Alignment.center,
              child: Text(
                'shop',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              )),
        ),
      ),
    );
  }
}
