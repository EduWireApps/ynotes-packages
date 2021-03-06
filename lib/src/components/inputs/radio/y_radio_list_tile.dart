part of components;

/// A list tile that uses [YRadio].
class YRadioListTile<T> extends StatelessWidget {
  /// The title of the tile.
  final String title;

  /// The radio value.
  final T value;

  /// The currently selected value for a group of radio buttons.
  final T groupValue;

  /// The function that gets triggered when the radio is selected. The value obtained
  /// must be used to update the state of the radio's [groupValue].
  final ValueChanged<T> onChanged;

  /// The color of the radio. Defaults to [YColor.primary].
  final YColor color;

  /// The condition to display the radio at the end of the tile instead.
  final bool end;

  /// A list tile that uses [YRadio].
  const YRadioListTile(
      {Key? key,
      required this.title,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      this.color = YColor.primary,
      this.end = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YOptionTile(
        title: title,
        widget:
            YRadio<T>(value: value, groupValue: groupValue, onChanged: onChanged as Function(dynamic), color: color),
        selected: value == groupValue,
        onTap: () {
          if (value != groupValue) {
            onChanged(value);
          }
        },
        color: color,
        end: end);
  }
}
