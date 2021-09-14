part of components;

/// A widget that maintains a vertical space of a given height.
///
/// Uses a [SizedBox] under the hood.
class YVerticalSpacer extends StatelessWidget {
  /// The height of the space.
  final double height;

  /// A widget that maintains a vertical space of a given height.
  ///
  /// Uses a [SizedBox] under the hood.
  const YVerticalSpacer(this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
      );
}

/// A widget that maintains a horizontal space of a given width.
///
/// Uses a [SizedBox] under the hood.
class YHorizontalSpacer extends StatelessWidget {
  final double width;
  const YHorizontalSpacer(this.width, {Key? key}) : super(key: key);

  /// A widget that maintains a horizontal space of a given width.
  ///
  /// Uses a [SizedBox] under the hood.
  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
      );
}
