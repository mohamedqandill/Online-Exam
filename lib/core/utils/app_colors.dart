import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color white = Color(0xffF9F9F9);
  static const Color grey = Color(0xff535353);
  static const Color red = Color(0xffCC1010);
  static const Color green = Color(0xff11CE19);
  static const Color lightBlue = Color(0xffEDEFF3);
  static const Color lightGreen = Color(0xffCAF9CC);
  static const Color lightRed = Color(0xffF8D2D2);
  static const Color placeHolder = Color(0xffA6A6A6);
  static const Map<int, Color> blueShades = {
    10: Color(0xFFCCD7EB),
    20: Color(0xFFABBcDE),
    30: Color(0xFF819BCE),
    40: Color(0xFF5679BD),
    50: Color(0xFF2C58AD), // Base is 50%
    60: Color(0xFF022DB2),
    70: Color(0xFF012468),
    80: Color(0xFF011B4E),
    90: Color(0xFF011234),
    100: Color(0xFF000B1F),
  };

  static const Map<int, Color> blackShades = {
    10: Color(0xFFCFCFCF),
    20: Color(0xFFAFAFAF),
    30: Color(0xFF878787),
    40: Color(0xFF5F5F5F),
    50: Color(0xFF373737), // Base is 50%
    60: Color(0xFF0D0D0D),
    70: Color(0xFF0A0A0A),
    80: Color(0xFF080808),
    90: Color(0xFF050505),
    100: Color(0xFF030303),
  };
}
