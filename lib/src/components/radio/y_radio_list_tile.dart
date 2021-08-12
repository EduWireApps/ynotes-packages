part of components;

class YRadioListTile<T> extends StatelessWidget {
  final String title;
  final T value;
  final T groupValue;
  final ValueChanged<dynamic> onChanged;
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
        widget: YRadio<T>(value: this.value, groupValue: this.groupValue, onChanged: this.onChanged, color: this.color),
        selected: this.value == this.groupValue,
        onTap: () {
          if (this.value != this.groupValue) {
            this.onChanged(this.value);
          }
        },
        color: this.color,
        end: this.end);
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ListTile(
  //     tileColor: this.value == this.groupValue ? style.lightColor : null,
  //     onTap: () {
  //       if (this.value != this.groupValue) {
  //         this.onChanged(this.value);
  //       }
  //     },
  //     title: Text(
  //       this.title,
  //       style:
  //           theme.texts.body1.copyWith(color: this.value == this.groupValue ? style.backgroundColor : this.titleColor),
  //     ),
  //     leading: YRadio<T>(value: this.value, groupValue: this.groupValue, onChanged: this.onChanged, color: this.color),
  //   );
  // }
}
