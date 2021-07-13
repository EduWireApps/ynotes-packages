import 'package:flutter/material.dart';
import 'package:ynotes_packages/components.dart';

import 'colors.dart';

class YTButtonStyleColors {
  final Color background;
  final Color text;
  final Color highlight;

  YTButtonStyleColors({required this.background, required this.text, required this.highlight});
}

class YTButtonStyle {
  final YTButtonStyleColors plain;
  final YTButtonStyleColors reverse;

  YTButtonStyle({required this.plain, required this.reverse});

  YTButtonStyleColors get(YButtonVariant variant) {
    switch (variant) {
      case YButtonVariant.plain:
        return this.plain;
      case YButtonVariant.reverse:
        return this.reverse;
    }
  }
}

class YTButtonStyles {
  final YTButtonStyle primary;
  final YTButtonStyle success;
  final YTButtonStyle warning;
  final YTButtonStyle danger;
  final YTButtonStyle neutral;
  final List<YTButtonStyle> styles;

  YTButtonStyles(
      {required this.primary,
      required this.success,
      required this.warning,
      required this.danger,
      required this.neutral,
      required this.styles});

  YTButtonStyle get(YColor color) {
    switch (color) {
      case YColor.primary:
        return this.primary;
      case YColor.success:
        return this.success;
      case YColor.warning:
        return this.warning;
      case YColor.danger:
        return this.danger;
      case YColor.neutral:
        return this.neutral;
    }
  }
}
