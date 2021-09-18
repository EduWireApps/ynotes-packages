part of components;

/// A floating action button;
class YFloatingButton extends StatelessWidget {
  /// The icon to display;
  final IconData icon;

  /// The action to perform when the button is pressed.
  final VoidCallback onPressed;

  /// The color of the button, [YColor.primary] by default.
  final YColor color;

  /// Invert background and foreground colors.
  final bool invertColors;

  /// A floating action button;
  const YFloatingButton(
      {Key? key, required this.icon, required this.onPressed, this.color = YColor.primary, this.invertColors = false})
      : super(key: key);

  YTColor get _style => theme.colors.get(color);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 1,
      child: Icon(icon, color: invertColors ? _style.backgroundColor : _style.foregroundColor),
      isExtended: false,
      onPressed: onPressed,
      backgroundColor: invertColors ? _style.foregroundColor : _style.backgroundColor,
      foregroundColor: invertColors ? _style.backgroundColor : _style.foregroundColor,
    );
  }
}
