import 'package:flutter/material.dart';

import 'themes/light.dart';
import 'themes/dark.dart';

class YTheme {
  final String name;
  final YAvailableTheme theme;
  final MaterialColor primary;
  final MaterialColor secondary;
  final MaterialColor success;
  final MaterialColor warning;
  final MaterialColor danger;
  final MaterialColor neutral;

  YTheme(
      {required this.name,
      required this.theme,
      required this.primary,
      required this.secondary,
      required this.success,
      required this.warning,
      required this.danger,
      required this.neutral});
}

class YCurrentTheme {
  final YAvailableTheme theme;
  final List<YTheme> themes;

  YCurrentTheme({required this.theme, required this.themes});

  YTheme get _ct => this.themes.firstWhere((t) => t.theme == this.theme);
  MaterialColor get primary => this._ct.primary;
  MaterialColor get secondary => this._ct.secondary;
  MaterialColor get success => this._ct.success;
  MaterialColor get warning => this._ct.warning;
  MaterialColor get danger => this._ct.danger;
  MaterialColor get neutral => this._ct.neutral;

  set theme(YAvailableTheme tn) => this.theme = tn;

  MaterialColor c(YColor color) {
    switch (color) {
      case YColor.primary:
        return this._ct.primary;
      case YColor.secondary:
        return this._ct.secondary;
      case YColor.success:
        return this._ct.success;
      case YColor.warning:
        return this._ct.warning;
      case YColor.danger:
        return this._ct.danger;
      case YColor.neutral:
        return this._ct.neutral;
    }
  }

  Color? get textColor => neutral[200];
  Color? get backgroundColor => neutral[800];
}

enum YColor { primary, secondary, success, warning, danger, neutral }

enum YAvailableTheme { light, dark }

final List<YTheme> themes = [lightTheme, darkTheme];

final YCurrentTheme currentTheme = YCurrentTheme(theme: YAvailableTheme.light, themes: themes);
