import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  var _text, _func;
  Test(text, func) {
    _text = text;
    _func = func;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 400,
      top: 300,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => _func),
        ),
        child: Transform(
          transform: Matrix4.identity()
            ..translate(0.0, 0.0)
            ..rotateZ(0),
          child: Container(
            width: 49,
            height: 44,
            decoration: ShapeDecoration(
              color: Color(0xFF516DFF),
              shape: StarBorder.polygon(
                side: BorderSide(width: 1, color: Color(0xFF6B6060)),
                sides: 3,
              ),
            ),
            child: Align(alignment: Alignment.center, child: Text(_text)),
          ),
        ),
      ),
    );
  }
}

/*
    @override
    Widget build(BuildContext context) {
      return Positioned(
        left: 400,
        top: 300,
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => func),
          ),
          child: Transform(
            transform: Matrix4.identity()
              ..translate(0.0, 0.0)
              ..rotateZ(0),
            child: Container(
              width: 49,
              height: 44,
              decoration: ShapeDecoration(
                color: Color(0xFF516DFF),
                shape: StarBorder.polygon(
                  side: BorderSide(width: 1, color: Color(0xFF6B6060)),
                  sides: 3,
                ),
              ),
              child: Align(alignment: Alignment.center, child: Text(text)),
            ),
          ),
        ),
      );
    }
*/