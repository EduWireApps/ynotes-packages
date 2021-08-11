import 'package:example/themes/utils/colors.dart';
import 'package:example/themes/utils/fonts.dart';
import 'package:example/themes/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:ynotes_packages/theme.dart';

final YTColor _primary = YTColor(
  foregroundColor: CustomColors.spaceDark[900]!,
  lightColor: CustomColors.spaceDark[200]!.withOpacity(.2),
  backgroundColor: CustomColors.spaceDark[200]!,
);

final YTColor _secondary = YTColor(
  foregroundColor: Colors.grey[50]!,
  lightColor: Colors.grey[500]!,
  backgroundColor: Colors.grey[800]!,
);

final YTColor _success = YTColor(
  foregroundColor: Colors.green[900]!,
  lightColor: Colors.green[200]!.withOpacity(.2),
  backgroundColor: Colors.green[200]!,
);

final YTColor _warning = YTColor(
  foregroundColor: Colors.amber[900]!,
  lightColor: Colors.amber[200]!.withOpacity(.2),
  backgroundColor: Colors.amber[200]!,
);

final YTColor _danger = YTColor(
  foregroundColor: Colors.red[900]!,
  lightColor: Colors.red[200]!.withOpacity(.2),
  backgroundColor: Colors.red[200]!,
);

final YTColors _colors = YTColors(
    backgroundColor: Color(0xff121212),
    backgroundLightColor: Color(0xff2c2c2c),
    foregroundColor: Colors.grey[50]!,
    foregroundLightColor: Colors.grey[500]!,
    primary: _primary,
    secondary: _secondary,
    success: _success,
    warning: _warning,
    danger: _danger);

final YTheme darkTheme =
    YTheme("Sombre", id: 2, isDark: true, colors: _colors, fonts: themeFonts, texts: texts(_colors, themeFonts));
