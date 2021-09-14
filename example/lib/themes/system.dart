import 'package:example/themes/dark.dart';
import 'package:example/themes/light.dart';
import 'package:flutter/material.dart';
import 'package:ynotes_packages/theme.dart';

YTheme systemTheme(Brightness brightness) {
  final bool darkModeOn = brightness == Brightness.dark;
  final YTheme t = darkModeOn ? darkTheme : lightTheme;

  final YTheme theme = YTheme("Système",
      id: 0, isDark: darkModeOn, colors: t.colors, splashColor: t.splashColor, fonts: t.fonts, texts: t.texts);
  return theme;
}
