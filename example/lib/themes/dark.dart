import 'package:example/themes/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:ynotes_packages/theme.dart';

final YTColor _primary = YTColor(
  foregroundColor: Colors.indigo[900]!,
  lightColor: Colors.indigo[600]!,
  backgroundColor: Colors.indigo[200]!,
);

final YTColor _success = YTColor(
  foregroundColor: Colors.green[900]!,
  lightColor: Colors.green[600]!,
  backgroundColor: Colors.green[200]!,
);

final YTColor _warning = YTColor(
  foregroundColor: Colors.amber[900]!,
  lightColor: Colors.amber[600]!,
  backgroundColor: Colors.amber[200]!,
);

final YTColor _danger = YTColor(
  foregroundColor: Colors.red[900]!,
  lightColor: Colors.red[600]!,
  backgroundColor: Colors.red[200]!,
);

final YTColors _colors = YTColors(
    backgroundColor: Colors.grey[900]!,
    backgroundLightColor: Colors.grey[800]!,
    foregroundColor: Colors.grey[50]!,
    foregroundLightColor: Colors.grey[500]!,
    primary: _primary,
    success: _success,
    warning: _warning,
    danger: _danger);

final YTheme darkTheme = YTheme("Sombre", id: 2, isDark: true, colors: _colors, fonts: themeFonts);
