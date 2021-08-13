part of components;

class YSwitchListTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final YColor color;
  final bool end;

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
