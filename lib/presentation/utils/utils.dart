import 'dart:math';

import 'package:flutter/material.dart';

//Utils class to write all the utility functions.
class Utils {
  static Color hexToColor(String hexString) {
    hexString = hexString.replaceAll('#', '');
    if (hexString.length == 6) {
      hexString = 'FF$hexString';
    }
    return Color(int.parse(hexString, radix: 16));
  }

  static FontWeight getFontWeight(String fontWeight) {
    if (fontWeight == "met_semi_bold") {
      return FontWeight.w600;
    } else if (fontWeight == "met_regular") {
      return FontWeight.w400;
    } else {
      return FontWeight.w200;
    }
  }

  static double angleToRadians(double angle) {
    return angle * (pi / 180);
  }
}
