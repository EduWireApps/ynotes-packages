part of components;

class YRadioListTile<T> extends StatelessWidget {
  final String title;
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final YColor color;
  final bool end;

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
        title: this.title,
        widget: YRadio<T>(
            value: this.value,
            groupValue: this.groupValue,
            onChanged: this.onChanged as Function(dynamic),
            color: this.color),
        selected: this.value == this.groupValue,
        onTap: () {
          if (this.value != this.groupValue) {
            this.onChanged(this.value);
          }
        },
        color: this.color,
        end: this.end);
  }
}
