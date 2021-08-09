import 'package:example/themes/utils/colors.dart';
import 'package:example/themes/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:ynotes_packages/theme.dart';

final YTColor _primary = YTColor(
  foregroundColor: Colors.white,
  lightColor: CustomColors.spaceLight[500]!.withOpacity(.2),
  backgroundColor: CustomColors.spaceLight[500]!,
);

final YTColor _secondary = YTColor(
  foregroundColor: Colors.grey[900]!,
  lightColor: Colors.grey[300]!,
  backgroundColor: Colors.grey[100]!,
);

final YTColor _success = YTColor(
  foregroundColor: Colors.white,
  lightColor: Colors.green[200]!,
  backgroundColor: Colors.green[500]!,
);

final YTColor _warning = YTColor(
  foregroundColor: Colors.white,
  lightColor: Colors.amber[200]!,
  backgroundColor: Colors.amber[500]!,
);

final YTColor _danger = YTColor(
  foregroundColor: Colors.white,
  lightColor: Colors.red[200]!,
  backgroundColor: Colors.red[500]!,
);

final YTColors _colors = YTColors(
    backgroundColor: Colors.white,
    backgroundLightColor: Colors.white,
    foregroundColor: Colors.grey[900]!,
    foregroundLightColor: Colors.grey[700]!,
    primary: _primary,
    secondary: _secondary,
    success: _success,
    warning: _warning,
    danger: _danger);

final YTheme lightTheme = YTheme("Clair", id: 1, isDark: false, colors: _colors, fonts: themeFonts);