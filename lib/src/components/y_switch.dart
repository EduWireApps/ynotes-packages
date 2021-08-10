part of components;

class YSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final YColor type;

  const YSwitch({Key? key, required this.value, required this.onChanged, this.type = YColor.primary}) : super(key: key);

  @override
  _YSwitchState createState() => _YSwitchState();
}

class _YSwitchState extends State<YSwitch> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final double width = YScale.s16;
    final double height = YScale.s8;

    return Container(
      width: width,
      height: height,
      child: FlutterSwitch(
        value: widget.value,
        onToggle: widget.onChanged,
        width: width,
        height: height,
        padding: YScale.s0p5,
        toggleSize: height - YScale.s0p5,
        toggleColor: theme.colors.backgroundLightColor,
        activeToggleColor: theme.colors.get(widget.type).backgroundColor,
        activeColor: theme.colors.get(widget.type).lightColor,
        inactiveColor: theme.colors.foregroundLightColor.withOpacity(.5),
        duration: Duration(milliseconds: 100),
      ),
    );
  }
}
