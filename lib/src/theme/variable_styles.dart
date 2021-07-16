part of theme;

enum YVariant { plain, reverse }

class YTVariableStyleColors {
  final Color background;
  final Color text;
  final Color highlight;

  YTVariableStyleColors({required this.background, required this.text, required this.highlight});
}

class YTVariableStyle {
  final YTVariableStyleColors plain;
  final YTVariableStyleColors reverse;

  YTVariableStyle({required this.plain, required this.reverse});

  YTVariableStyleColors get(YVariant variant) {
    switch (variant) {
      case YVariant.plain:
        return this.plain;
      case YVariant.reverse:
        return this.reverse;
    }
  }
}

class YTVariableStyles {
  final YTVariableStyle primary;
  final YTVariableStyle success;
  final YTVariableStyle warning;
  final YTVariableStyle danger;
  final YTVariableStyle neutral;
  final List<YTVariableStyle> styles;

  YTVariableStyles(
      {required this.primary,
      required this.success,
      required this.warning,
      required this.danger,
      required this.neutral,
      required this.styles});

  YTVariableStyle get(YColor color) {
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
