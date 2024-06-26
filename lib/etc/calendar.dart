import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 478,
          height: 841,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 478,
                  height: 841,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: Color(0xFF207F66)),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 16,
                        top: 16,
                        child: Container(
                          width: 445,
                          height: 804,
                          decoration: ShapeDecoration(
                            color: Color(0xFF48AA7B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 186,
                        top: 753,
                        child: Container(
                          width: 109,
                          height: 54,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 215,
                        top: 769,
                        child: Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.63,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 31,
                        top: 117,
                        child: Container(
                          padding: const EdgeInsets.all(53.31),
                          decoration: ShapeDecoration(
                            color: Color(0xFF1E1F25),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.74, color: Color(0xFF09090B)),
                              borderRadius: BorderRadius.circular(8.88),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x07AAAAAA),
                                blurRadius: 23.69,
                                offset: Offset(0, 2.96),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 291.45,
                                height: 22,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Text(
                                        'May 2024',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.77,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 262.86,
                                      top: 6.66,
                                      child: SizedBox(
                                        width: 28.60,
                                        height: 8.38,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(width: 11.85),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 41.46),
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 306.59,
                                      height: 247.81,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: SizedBox(
                                              width: 306.59,
                                              height: 22,
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 0,
                                                    child: Text(
                                                      'Mo',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 51.86,
                                                    top: -0,
                                                    child: Text(
                                                      'Tu',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 97.76,
                                                    top: -0,
                                                    child: Text(
                                                      'We',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 149.59,
                                                    top: -0,
                                                    child: Text(
                                                      'Th',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 196.23,
                                                    top: -0,
                                                    child: Text(
                                                      'Fr',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 237.69,
                                                    top: -0,
                                                    child: Text(
                                                      'Sa',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 283.59,
                                                    top: -0,
                                                    child: Text(
                                                      'Su',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 156.25,
                                            top: 45.16,
                                            child: SizedBox(
                                              width: 144.52,
                                              height: 22,
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 0,
                                                    child: Text(
                                                      '1',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 43.68,
                                                    top: -0,
                                                    child: Text(
                                                      '2',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 86.62,
                                                    top: -0,
                                                    child: Text(
                                                      '3',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 132.52,
                                                    top: -0,
                                                    child: Text(
                                                      '4',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 8.18,
                                            top: 90.32,
                                            child: SizedBox(
                                              width: 295.37,
                                              height: 22,
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 0,
                                                    child: Text(
                                                      '5',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 48.12,
                                                    top: 0,
                                                    child: Text(
                                                      '6',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 97.73,
                                                    top: 0,
                                                    child: Text(
                                                      '7',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 146.59,
                                                    top: 0,
                                                    child: Text(
                                                      '8',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 191.01,
                                                    top: 0,
                                                    child: Text(
                                                      '9',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 230.99,
                                                    top: 0,
                                                    child: Text(
                                                      '10',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 278.37,
                                                    top: 0,
                                                    child: Text(
                                                      '11',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 3.74,
                                            top: 125.12,
                                            child: SizedBox(
                                              width: 301.34,
                                              height: 41.46,
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    left: -0,
                                                    top: 10.37,
                                                    child: Text(
                                                      '12',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 48.86,
                                                    top: 10.37,
                                                    child: Text(
                                                      '13',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 86.62,
                                                    top: -0,
                                                    child: Container(
                                                      width: 41.46,
                                                      height: 41.46,
                                                      decoration:
                                                          ShapeDecoration(
                                                        color:
                                                            Color(0xFF579C5E),
                                                        shape: OvalBorder(),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 96.99,
                                                    top: 10.37,
                                                    child: Text(
                                                      '14',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 147.33,
                                                    top: 10.37,
                                                    child: Text(
                                                      '15',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 191.75,
                                                    top: 10.37,
                                                    child: Text(
                                                      '16',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 235.43,
                                                    top: 10.37,
                                                    child: Text(
                                                      '17',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 281.34,
                                                    top: 10.37,
                                                    child: Text(
                                                      '18',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 3.74,
                                            top: 180.65,
                                            child: SizedBox(
                                              width: 301.86,
                                              height: 22,
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 0,
                                                    child: Text(
                                                      '19',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 47.38,
                                                    top: 0,
                                                    child: Text(
                                                      '20',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 97.73,
                                                    top: 0,
                                                    child: Text(
                                                      '21',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 145.85,
                                                    top: 0,
                                                    child: Text(
                                                      '22',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 190.27,
                                                    top: 0,
                                                    child: Text(
                                                      '23',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 233.95,
                                                    top: 0,
                                                    child: Text(
                                                      '24',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 279.86,
                                                    top: 0,
                                                    child: Text(
                                                      '25',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 2.38,
                                            top: 225.81,
                                            child: SizedBox(
                                              width: 258.40,
                                              height: 22,
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 0,
                                                    child: Text(
                                                      '26',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 49.60,
                                                    top: -0,
                                                    child: Text(
                                                      '27',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 97.73,
                                                    top: -0,
                                                    child: Text(
                                                      '28',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 147.33,
                                                    top: -0,
                                                    child: Text(
                                                      '29',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 191.75,
                                                    top: -0,
                                                    child: Text(
                                                      '30',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 238.40,
                                                    top: -0,
                                                    child: Text(
                                                      '31',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFCCCCCC),
                                                        fontSize: 17.77,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 31,
                        top: 36,
                        child: SizedBox(
                          width: 67,
                          height: 30,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 36,
                                top: 4,
                                child: SizedBox(
                                  width: 31,
                                  height: 26,
                                  child: Text(
                                    '35',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFFBFBFB),
                                      fontSize: 17.77,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 150,
                        top: 57,
                        child: Text(
                          'Calendar',
                          style: TextStyle(
                            color: Color(0xFFFFF3F3),
                            fontSize: 40.52,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 417,
                        top: 21,
                        child: SizedBox(width: 38, height: 41, child: Stack()),
                      ),
                      Positioned(
                        left: 321,
                        top: 21,
                        child: Container(
                          width: 48,
                          height: 41,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://via.placeholder.com/48x41"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 33,
                        top: 753,
                        child: Container(
                          width: 109,
                          height: 54,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 48,
                        top: 769,
                        child: Text(
                          'Statistics',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.63,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 336,
                        top: 753,
                        child: Container(
                          width: 109,
                          height: 54,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 353,
                        top: 769,
                        child: Text(
                          'Statistics',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.63,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
