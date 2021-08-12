part of components;

class YOptionTile extends StatelessWidget {
  final String title;
  final YColor color;
  final Color? titleColor;
  final bool end;
  final Widget widget;
  final bool selected;
  final VoidCallback onTap;

  const YOptionTile(
      {Key? key,
      required this.title,
      this.color = YColor.primary,
      this.titleColor,
      this.end = false,
      required this.widget,
      required this.selected,
      required this.onTap})
      : super(key: key);

  YTColor get style => theme.colors.get(this.color);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: this.selected ? style.lightColor : null,
      onTap: this.onTap,
      title: Text(
        this.title,
        style: theme.texts.body1.copyWith(color: this.selected ? style.backgroundColor : this.titleColor),
      ),
      leading: this.end ? null : this.widget,
      trailing: this.end ? this.widget : null,
    );
  }
}
