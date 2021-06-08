import 'package:flutter/material.dart';

import 'themes/light.dart';

class YTheme {
  final String name;
  final MaterialColor primary;
  final MaterialColor secondary;
  final MaterialColor success;
  final MaterialColor warning;
  final MaterialColor danger;
  final MaterialColor neutral;

  YTheme(
      {required this.name,
      required this.primary,
      required this.secondary,
      required this.success,
      required this.warning,
      required this.danger,
      required this.neutral});
}

class YCurrentTheme {
  final String themeName;
  final List<YTheme> themes;

  YCurrentTheme({required this.themeName, required this.themes});

  YTheme get _ct => this.themes.firstWhere((t) => t.name == this.themeName);
  MaterialColor get primary => this._ct.primary;
  MaterialColor get secondary => this._ct.secondary;
  MaterialColor get success => this._ct.success;
  MaterialColor get warning => this._ct.warning;
  MaterialColor get danger => this._ct.danger;
  MaterialColor get neutral => this._ct.neutral;

  set themeName(String tn) => this.themeName = tn;

  MaterialColor c(String color) {
    switch (color) {
      case "primary":
        return this._ct.primary;
      case "secondary":
        return this._ct.secondary;
      case "success":
        return this._ct.success;
      case "warning":
        return this._ct.warning;
      case "danger":
        return this._ct.danger;
      case "neutral":
        return this._ct.neutral;
    }
    throw "Invalid color!";
  }
}

final YCurrentTheme currentTheme =
    YCurrentTheme(themeName: "light", themes: [lightTheme]);
