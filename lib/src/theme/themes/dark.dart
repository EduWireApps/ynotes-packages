import 'package:flutter/material.dart';
import '../../theme/theme.dart';

// https://www.shadegenerator.com/

final MaterialColor _primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xffeceef8),
  100: Color(0xffc7cbea),
  200: Color(0xffa2a8dc),
  300: Color(0xff7d85ce),
  400: Color(0xff5863c0),
  500: Color(_primaryPrimaryValue),
  600: Color(0xff313982),
  700: Color(0xff23295d),
  800: Color(0xff151838),
  900: Color(0xff070813),
});
final int _primaryPrimaryValue = 0xff3f49a7;

final MaterialColor _success = MaterialColor(_successPrimaryValue, <int, Color>{
  50: Color(0xffecf8f0),
  100: Color(0xffc7ead1),
  200: Color(0xffa2dcb3),
  300: Color(0xff7dce94),
  400: Color(0xff58c075),
  500: Color(_successPrimaryValue),
  600: Color(0xff318247),
  700: Color(0xff235d33),
  800: Color(0xff15381f),
  900: Color(0xff07130a),
});
final int _successPrimaryValue = 0xff3fa75c;

final MaterialColor _warning = MaterialColor(_warningPrimaryValue, <int, Color>{
  50: Color(0xfffff9e6),
  100: Color(0xfffeecb4),
  200: Color(0xfffde082),
  300: Color(0xfffcd44f),
  400: Color(0xfffbc71d),
  500: Color(_warningPrimaryValue),
  600: Color(0xffb08703),
  700: Color(0xff7d6102),
  800: Color(0xff4b3a01),
  900: Color(0xff191300),
});
final int _warningPrimaryValue = 0xffe2ae04;

final MaterialColor _danger = MaterialColor(_dangerPrimaryValue, <int, Color>{
  50: Color(0xfffef3f3),
  100: Color(0xfffcc2c2),
  200: Color(0xfff98585),
  300: Color(0xfff75555),
  400: Color(0xfff42424),
  500: Color(_dangerPrimaryValue),
  600: Color(0xffaa0808),
  700: Color(0xff7a0606),
  800: Color(0xff490404),
  900: Color(0xff180101),
});
final int _dangerPrimaryValue = 0xffdb0b0b;

final MaterialColor _neutral = MaterialColor(_neutralPrimaryValue, <int, Color>{
  50: Color(0xfff2f2f2),
  100: Color(0xffd9d9d9),
  200: Color(0xffbfbfbf),
  300: Color(0xffa6a6a6),
  400: Color(0xff8c8c8c),
  500: Color(_neutralPrimaryValue),
  600: Color(0xff595959),
  700: Color(0xff404040),
  800: Color(0xff262626),
  900: Color(0xff0d0d0d),
});
final int _neutralPrimaryValue = 0xff737373;

final YTheme darkTheme = YTheme(
    name: "Sombre",
    theme: YAvailableTheme.dark,
    primary: _primary,
    success: _success,
    warning: _warning,
    danger: _danger,
    neutral: _neutral);
