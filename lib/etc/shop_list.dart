import 'package:flutter/material.dart';

class ShopList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
        child: Expanded(
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: 9,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.81,
              mainAxisSpacing: 28,
              crossAxisSpacing: 15),
          itemBuilder: (BuildContext context, index) {
            return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/shopitembackground.png"))),
                child: Positioned(
                  top: 30,
                  child: Container(
                    child: ShopItem(),
                  ),
                ));
          }),
    ));
  }
}

class ShopItem extends StatelessWidget {
  var _price;

  ShopItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      //alignment: Alignment.center,
      children: [
        Positioned(top: 50, bottom: 10, child: Card()),
        //image
        Positioned(
          top: 200,
          bottom: 50,
          child: SizedBox(
            width: 68,
            height: 67,
            child: Image.asset(
              "assets/images/heart.png",
              alignment: Alignment.center,
            ),
          ),
        ),
        Positioned(top: 40, bottom: 20, child: Card()),
        //price
        Positioned(
          //left: 30,
          top: 100,
          child: Container(
              width: 85,
              height: 32,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/price.png"),
              )),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "$_price",
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 20),
                ),
              )),
        )
      ],
    );
  }
}
