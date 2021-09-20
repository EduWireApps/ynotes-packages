part of components;

/// A radio input.
class YRadio<T> extends StatelessWidget {
  /// The value of the radio.
  final T value;

  /// The currently selected value for a group of radio buttons.
  final T groupValue;

  /// The function that gets triggered when the radio is selected. The value obtained
  /// must be used to update the state of the radio's [groupValue].
  final ValueChanged<dynamic> onChanged;

  /// The color of the radio. Defaults to [YColor.primary].
  final YColor color;

  /// A radio input.
  const YRadio(
      {Key? key, required this.value, required this.groupValue, required this.onChanged, this.color = YColor.primary})
      : super(key: key);

  YTColor get _style => theme.colors.get(color);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: theme.colors.foregroundLightColor),
      child: Radio<T>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: _style.backgroundColor,
        // onChanged: _onChanged,
      ),
    );
  }
}
