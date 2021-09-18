part of components;

/// A list tile that uses [YSwitch].
class YSwitchListTile extends StatelessWidget {
  /// The title of the tile.
  final String title;

  /// The switch value.
  final bool value;

  /// The function that gets triggered when the switch is toggled. The value obtained
  /// must be used to update the state of the switch.
  final ValueChanged<bool> onChanged;

  /// The color of the switch. Defaults to [YColor.primary].
  final YColor color;

  /// The condition to display the switch at the end of the tile instead.
  final bool end;

  /// A list tile that uses [YSwitch].
  const YSwitchListTile(
      {Key? key,
      required this.title,
      required this.value,
      required this.onChanged,
      this.color = YColor.primary,
      this.end = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YOptionTile(
        title: this.title,
        widget: YSwitch(value: this.value, onChanged: this.onChanged, color: this.color),
        selected: this.value,
        onTap: () => this.onChanged(!this.value),
        color: this.color,
        end: this.end);
  }
}
