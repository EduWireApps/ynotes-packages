part of theme;

/// A class that manages the [TextStyle]s available for a [YTheme].
///
/// Warning: There are subject to change.
class YTTexts {
  /// The biggest title.
  final TextStyle headline;

  /// The title.
  final TextStyle title;

  /// The body. Prefer it to [body2] for content.
  final TextStyle body1;

  /// The body. Acts as a caption.
  final TextStyle body2;

  /// The style used for big data.
  final TextStyle data1;

  /// The style used for smaller data.
  final TextStyle data2;

  /// The style used for button texts, but also tabbars etc...
  final TextStyle button;

  /// The style used for links.
  final TextStyle link;

  /// A class that manages the [TextStyle]s available for a [YTheme].
  ///
  /// Warning: There are subject to change.
  YTTexts(
      {required this.headline,
      required this.title,
      required this.body1,
      required this.body2,
      required this.data1,
      required this.data2,
      required this.button,
      required this.link});
}
