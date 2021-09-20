part of components;

/// A switch to toggle.
class YSwitch extends StatelessWidget {
  /// The switch's value.
  final bool value;

  /// The function that gets triggered when the switch is toggled. The value obtained
  /// must be used to update the state of the switch.
  final ValueChanged<bool> onChanged;

  /// The color of the switch. Defaults to [YColor.primary].
  final YColor color;

  /// A switch to toggle.
  const YSwitch({Key? key, required this.value, required this.onChanged, this.color = YColor.primary})
      : super(key: key);

  YTColor get _style => theme.colors.get(color);

  @override
  Widget build(BuildContext context) {
    final double width = YScale.s12;
    final double height = YScale.s6;

    return SizedBox(
      width: width,
      height: height,
      child: FlutterSwitch(
        value: value,
        onToggle: onChanged,
        width: width,
        height: height,
        padding: YScale.s0p5,
        toggleSize: height - YScale.s0p5,
        toggleColor: theme.colors.foregroundLightColor,
        activeToggleColor: _style.foregroundColor,
        activeColor: _style.backgroundColor,
        inactiveColor: theme.colors.backgroundLightColor,
        duration: const Duration(milliseconds: 100),
      ),
    );
  }
}
