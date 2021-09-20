part of components;

/// A checkbox that, well, does what checkboxes usually do. They tick and untick.
class YCheckbox extends StatelessWidget {
  /// The checkbox's value.
  final bool value;

  /// The function that gets triggered when the checkbox is toggled. The value obtained
  /// must be used to update the state of the checkbox.
  final ValueChanged<bool> onChanged;

  /// The color of the checkbox. Defaults to [YColor.primary].
  final YColor color;

  /// A checkbox that, well, does what checkboxes usually do. They tick and untick.
  const YCheckbox({Key? key, required this.value, required this.onChanged, this.color = YColor.primary})
      : super(key: key);

  YTColor get _style => theme.colors.get(color);

  void _onChanged(bool? value) => onChanged(value!);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: theme.colors.foregroundLightColor),
      child: Checkbox(
        activeColor: _style.backgroundColor,
        checkColor: _style.foregroundColor,
        value: value,
        onChanged: _onChanged,
        shape: RoundedRectangleBorder(borderRadius: YBorderRadius.normal),
      ),
    );
  }
}
