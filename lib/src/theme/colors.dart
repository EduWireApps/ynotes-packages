part of theme;

enum YColor { primary, success, warning, danger, neutral }

class YTColor {
  final Color shade100;
  final Color shade200;
  final Color shade300;
  final Color shade400;
  final Color shade500;

  const YTColor(
      {required this.shade100,
      required this.shade200,
      required this.shade300,
      required this.shade400,
      required this.shade500});
}

class YTColors {
  final YTColor primary;
  final YTColor success;
  final YTColor warning;
  final YTColor danger;
  final YTColor neutral;

  YTColors(
      {required this.primary,
      required this.success,
      required this.warning,
      required this.danger,
      required this.neutral});

  YTColor get(YColor color) {
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
