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
    final double width = YScale.s12;
    final double height = YScale.s7;

    return Container(
      width: width,
      height: height,
      child: FlutterSwitch(
        value: widget.value,
        onToggle: widget.onChanged,
        width: width,
        height: height,
        padding: YScale.s0p5,
        toggleColor: theme.colors.neutral.shade200,
        activeToggleColor: theme.colors.get(widget.type).shade100,
        activeColor: theme.colors.get(widget.type).shade300,
        inactiveColor: theme.colors.neutral.shade100,
        duration: Duration(milliseconds: 100),
      ),
    );
  }
}
