part of components;

/// A button that only contains an icon.
class YIconButton extends StatelessWidget {
  /// The icon to display.
  final IconData icon;

  /// The label of the button.
  final String? tooltip;

  /// The action to perform when the button is clicked.
  final VoidCallback onPressed;

  /// The color of the icon.
  final Color? foregroundColor;

  /// The color of the background.
  final Color? backgroundColor;

  /// A button that only contains an icon.
  const YIconButton(
      {Key? key, required this.icon, this.tooltip, required this.onPressed, this.foregroundColor, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: backgroundColor, borderRadius: YBorderRadius.full),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: foregroundColor ?? theme.colors.foregroundLightColor),
          splashRadius: 20.0,
          tooltip: tooltip,
        ));
  }
}
