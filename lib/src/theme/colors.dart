part of theme;

/// The main colors of the app.
enum YColor { primary, secondary, success, warning, danger, info }

/// A class that manages variations of a color to ensure great contrast and lisibility.
class YTColor extends Equatable {
  /// The main color. It can also be used as a text color if contrast is great enough.
  final Color backgroundColor;

  /// The color used for text on top of [backgroundColor].
  ///
  /// For example, don't use [theme.colors.foregroundColor] on top of [theme.colors.primary.backgroundColor]
  /// but [theme.colors.primary.foregroundColor].
  final Color foregroundColor;

  /// A color used on top of other colors. By light it means that it less visible than [backgroundColor]
  /// (because a bit transparent) but keeps a good contrast with [backgroundColor].
  ///
  /// Its opacity must be <= 0.8.
  final Color lightColor;

  /// A class that manages variations of a color to ensure great contrast and lisibility.
  const YTColor({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.lightColor,
  });

  @override
  List<Object> get props => [backgroundColor, foregroundColor, lightColor];
}

/// A class that manages colors for a theme.
class YTColors {
  /// The app background color.
  final Color backgroundColor;

  /// The app background color but clearer than [backgroundColor].
  ///
  /// Must be used for separators, between elements that need to be showcased.
  final Color backgroundLightColor;

  /// The app text color. Prefer it for titles and important text.
  final Color foregroundColor;

  /// The app text color but darker than [foregroundColor].
  ///
  /// Must be used for text that doesn't need as much attention.
  final Color foregroundLightColor;

  /// The theme primary color that corresponds to [YColor.primary]. Can be anything.
  final YTColor primary;

  /// The theme secondary color that corresponds to [YColor.secondary].
  final YTColor secondary;

  /// The theme success color that corresponds to [YColor.success]. Usually green.
  final YTColor success;

  /// The theme warning color that corresponds to [YColor.warning]. Usually yellow.
  final YTColor warning;

  /// The theme danger color that corresponds to [YColor.danger]. Usually red.
  final YTColor danger;

  /// The theme info color that corresponds to [YColor.info]. Usually blue.
  final YTColor info;

  /// A class that manages colors for a theme.
  YTColors(
      {required this.backgroundColor,
      required this.backgroundLightColor,
      required this.foregroundColor,
      required this.foregroundLightColor,
      required this.primary,
      required this.secondary,
      required this.success,
      required this.warning,
      required this.danger,
      required this.info});

  /// Returns a color based on [YColor] (enum). Useful for dynamic colors
  /// such as in components.
  YTColor get(YColor color) {
    switch (color) {
      case YColor.primary:
        return primary;
      case YColor.secondary:
        return secondary;
      case YColor.success:
        return success;
      case YColor.warning:
        return warning;
      case YColor.danger:
        return danger;
      case YColor.info:
        return info;
    }
  }
}
