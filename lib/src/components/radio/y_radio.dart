part of components;

class YRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<dynamic> onChanged;
  final YColor color;

  const YRadio(
      {Key? key, required this.value, required this.groupValue, required this.onChanged, this.color = YColor.primary})
      : super(key: key);

  YTColor get style => theme.colors.get(this.color);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: theme.colors.foregroundLightColor),
      child: Radio<T>(
        value: this.value,
        groupValue: this.groupValue,
        onChanged: this.onChanged,
        activeColor: style.backgroundColor,
        // onChanged: _onChanged,
      ),
    );
  }
}
