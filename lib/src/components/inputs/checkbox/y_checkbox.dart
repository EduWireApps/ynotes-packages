part of components;

class YCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final YColor color;

  const YCheckbox({Key? key, required this.value, required this.onChanged, this.color = YColor.primary})
      : super(key: key);

  YTColor get style => theme.colors.get(this.color);

  void _onChanged(bool? value) => this.onChanged(value!);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: theme.colors.foregroundLightColor),
      child: Checkbox(
        activeColor: style.backgroundColor,
        checkColor: style.foregroundColor,
        value: this.value,
        onChanged: _onChanged,
        shape: RoundedRectangleBorder(borderRadius: YBorderRadius.normal),
      ),
    );
  }
}
