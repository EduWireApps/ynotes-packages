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
  YTVariableStyleColors get style => theme.buttonStyles.get(widget.type).plain;

  void _onChanged(bool? value) => widget.onChanged(value!);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: theme.colors.neutral.shade100),
      child: Checkbox(
        activeColor: style.background,
        checkColor: style.text,
        value: widget.value,
        onChanged: _onChanged,
        shape: RoundedRectangleBorder(borderRadius: YBorderRadius.normal),
      ),
    );
  }
}
