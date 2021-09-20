part of components;

/// A list tile that uses [YCheckbox].
class YCheckboxListTile extends StatelessWidget {
  /// The title of the tile.
  final String title;

  /// The checkbox value.
  final bool value;

  /// The function that gets triggered when the checkbox is toggled. The value obtained
  /// must be used to update the state of the checkbox.
  final ValueChanged<bool> onChanged;

  /// The color of the checkbox. Defaults to [YColor.primary].
  final YColor color;

  /// The condition to display the checkbox at the end of the tile instead.
  final bool end;

  /// A list tile that uses [YCheckbox].
  const YCheckboxListTile(
      {Key? key,
      required this.title,
      required this.value,
      required this.onChanged,
      this.color = YColor.primary,
      this.end = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YOptionTile(
        title: title,
        widget: YCheckbox(value: value, onChanged: onChanged, color: color),
        selected: value,
        onTap: () => onChanged(!value),
        color: color,
        end: end);
  }
}
