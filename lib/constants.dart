import 'dart:ui';

import 'package:flutter/material.dart';

class YUtils {
  YUtils();

  String enumToString(dynamic v) => v.toString().split('.')[1];

  MaterialColor getColor(final YColor c) {
    switch (c) {
      case YColor.primary:
        return YColors.primary;
      case YColor.secondary:
        return YColors.secondary;
      case YColor.success:
        return YColors.success;
      case YColor.warning:
        return YColors.warning;
      case YColor.danger:
        return YColors.danger;
      case YColor.neutral:
        return YColors.neutral;
    }
  }
}

final Map colors = {
  "primary": {
    50: Color(0xffeceef8),
    100: Color(0xffc7cbea),
    200: Color(0xffa2a8dc),
    300: Color(0xff7d85ce),
    400: Color(0xff5863c0),
    500: Color(0xff3f49a7),
    600: Color(0xff313982),
    700: Color(0xff23295d),
    800: Color(0xff151838),
    900: Color(0xff070813),
  },
  "secondary": {
    50: Color(0xffecf8f6),
    100: Color(0xffc7eae4),
    200: Color(0xffa2dcd2),
    300: Color(0xff7dcebf),
    400: Color(0xff58c0ad),
    500: Color(0xff3fa794),
    600: Color(0xff318273),
    700: Color(0xff235d52),
    800: Color(0xff153831),
    900: Color(0xff071310),
  },
  "success": {
    50: Color(0xffecf8f0),
    100: Color(0xffc7ead1),
    200: Color(0xffa2dcb3),
    300: Color(0xff7dce94),
    400: Color(0xff58c075),
    500: Color(0xff3fa75c),
    600: Color(0xff318247),
    700: Color(0xff235d33),
    800: Color(0xff15381f),
    900: Color(0xff07130a),
  },
  "warning": {
    50: Color(0xfffff9e6),
    100: Color(0xfffeecb4),
    200: Color(0xfffde082),
    300: Color(0xfffcd44f),
    400: Color(0xfffbc71d),
    500: Color(0xffe2ae04),
    600: Color(0xffb08703),
    700: Color(0xff7d6102),
    800: Color(0xff4b3a01),
    900: Color(0xff191300),
  },
  "danger": {
    50: Color(0xfffef3f3),
    100: Color(0xfffcc2c2),
    200: Color(0xfff98585),
    300: Color(0xfff75555),
    400: Color(0xfff42424),
    500: Color(0xffdb0b0b),
    600: Color(0xffaa0808),
    700: Color(0xff7a0606),
    800: Color(0xff490404),
    900: Color(0xff180101),
  },
  "neutral": {
    50: Color(0xfff2f2f2),
    100: Color(0xffd9d9d9),
    200: Color(0xffbfbfbf),
    300: Color(0xffa6a6a6),
    400: Color(0xff8c8c8c),
    500: Color(0xff737373),
    600: Color(0xff595959),
    700: Color(0xff404040),
    800: Color(0xff262626),
    900: Color(0xff0d0d0d),
  }
};

enum YColor { primary, secondary, success, warning, danger, neutral }
enum YTheme { light, dark }

class YThemes {
  final YTheme _theme;

  YThemes(this._theme);

  Type _colors() {
    switch (this._theme) {
      case YTheme.light:
        return YColors;
      case YTheme.dark:
        return YColors;
    }
  }

  Type get colors => _colors();
}

class YColors {
  YColors._();

  static const MaterialColor primary =
      MaterialColor(_primaryPrimaryValue, <int, Color>{
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
  static const int _primaryPrimaryValue = 0xff3f49a7;

  static const MaterialColor secondary =
      MaterialColor(_secondaryPrimaryValue, <int, Color>{
    50: Color(0xffecf8f6),
    100: Color(0xffc7eae4),
    200: Color(0xffa2dcd2),
    300: Color(0xff7dcebf),
    400: Color(0xff58c0ad),
    500: Color(_secondaryPrimaryValue),
    600: Color(0xff318273),
    700: Color(0xff235d52),
    800: Color(0xff153831),
    900: Color(0xff071310),
  });
  static const int _secondaryPrimaryValue = 0xff3fa794;

  static const MaterialColor success =
      MaterialColor(_successPrimaryValue, <int, Color>{
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
  static const int _successPrimaryValue = 0xff3fa75c;

  static const MaterialColor warning =
      MaterialColor(_warningPrimaryValue, <int, Color>{
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
  static const int _warningPrimaryValue = 0xffe2ae04;

  static const MaterialColor danger =
      MaterialColor(_dangerPrimaryValue, <int, Color>{
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
  static const int _dangerPrimaryValue = 0xffdb0b0b;

  static const MaterialColor neutral =
      MaterialColor(_neutralPrimaryValue, <int, Color>{
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
  static const int _neutralPrimaryValue = 0xff737373;
}
