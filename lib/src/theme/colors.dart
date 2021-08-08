part of theme;

enum YColor { primary, secondary, success, warning, danger }

class YTColor {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color lightColor;

  const YTColor({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.lightColor,
  });
}

class YTColors {
  final Color backgroundColor;
  final Color backgroundLightColor;
  final Color foregroundColor;
  final Color foregroundLightColor;

  final YTColor primary;
  final YTColor secondary;
  final YTColor success;
  final YTColor warning;
  final YTColor danger;

  YTColors({
    required this.backgroundColor,
    required this.backgroundLightColor,
    required this.foregroundColor,
    required this.foregroundLightColor,
    required this.primary,
    required this.secondary,
    required this.success,
    required this.warning,
    required this.danger,
  });

  YTColor get(YColor color) {
    switch (color) {
      case YColor.primary:
        return this.primary;
      case YColor.secondary:
        return this.secondary;
      case YColor.success:
        return this.success;
      case YColor.warning:
        return this.warning;
      case YColor.danger:
        return this.danger;
    }
  }
}
