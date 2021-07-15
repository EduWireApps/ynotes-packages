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
    final double width = 60.0;
    final double height = 30.0;

    return Container(
      width: width,
      height: height,
      child: FlutterSwitch(
        value: widget.value,
        onToggle: widget.onChanged,
        width: width,
        height: height,
        padding: 2.0,
        activeColor: theme.colors.get(widget.type).shade300,
        inactiveColor: theme.colors.neutral.shade100,
        duration: Duration(milliseconds: 100),
      ),
    );
  }
}
