import 'package:flutter/material.dart';

class CustomColors {
  CustomColors._();

  static const MaterialColor spaceLight = MaterialColor(_primarySpaceLightValue, <int, Color>{
    50: Color(0xffe8ebf2),
    100: Color(0xffc5cbe1),
    200: Color(0xffa0aacc),
    300: Color(0xff7c89b7),
    400: Color(0xff616fa8),
    500: Color(_primarySpaceLightValue), // Color(0xff46579b)
    600: Color(0xff404f92),
    700: Color(0xff384586),
    800: Color(0xff303c79),
    900: Color(0xff252b62),
  });
  static const int _primarySpaceLightValue = 0xff46579b;

  static const MaterialColor spaceDark = MaterialColor(_primarySpaceDarkValue, <int, Color>{
    50: Color(0xffB8C9F2),
    100: Color(0xff99A8E1),
    200: Color(0xff94ACFF),
    300: Color(0xff586DB7),
    400: Color(0xff616fa8),
    500: Color(_primarySpaceDarkValue), // Color(0xff273E9B)
    600: Color(0xff233792),
    700: Color(0xff1D2F86),
    800: Color(0xff182879),
    900: Color(0xff121A62),
  });
  static const int _primarySpaceDarkValue = 0xff273E9B;
}
