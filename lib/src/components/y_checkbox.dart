part of components;

class YCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final YColor type;

  const YCheckbox({Key? key, required this.value, required this.onChanged, this.type = YColor.primary})
      : super(key: key);

  @override
  _YCheckboxState createState() => _YCheckboxState();
}

class _YCheckboxState extends State<YCheckbox> {
  YTColor get style => theme.colors.get(widget.type);

  void _onChanged(bool? value) => widget.onChanged(value!);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: theme.colors.foregroundLightColor),
      child: Checkbox(
        activeColor: style.backgroundColor,
        checkColor: style.foregroundColor,
        value: widget.value,
        onChanged: _onChanged,
        shape: RoundedRectangleBorder(borderRadius: YBorderRadius.normal),
      ),
    );
  }
}
