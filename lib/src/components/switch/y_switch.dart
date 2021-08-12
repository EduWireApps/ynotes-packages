part of components;

class YSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final YColor color;

  const YSwitch({Key? key, required this.value, required this.onChanged, this.color = YColor.primary})
      : super(key: key);

  YTColor get style => theme.colors.get(this.color);

  @override
  Widget build(BuildContext context) {
    final double width = YScale.s12;
    final double height = YScale.s6;

    return Container(
      width: width,
      height: height,
      child: FlutterSwitch(
        value: this.value,
        onToggle: this.onChanged,
        width: width,
        height: height,
        padding: YScale.s0p5,
        toggleSize: height - YScale.s0p5,
        toggleColor: theme.colors.backgroundLightColor,
        activeToggleColor: style.foregroundColor,
        activeColor: style.backgroundColor,
        inactiveColor: theme.colors.foregroundLightColor.withOpacity(.5),
        duration: Duration(milliseconds: 100),
      ),
    );
  }
}
