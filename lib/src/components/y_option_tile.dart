part of components;

class YOptionTile extends StatelessWidget {
  final String title;
  final YColor color;
  final bool end;
  final Widget widget;
  final bool selected;
  final VoidCallback onTap;

  const YOptionTile(
      {Key? key,
      required this.title,
      this.color = YColor.primary,
      this.end = false,
      required this.widget,
      required this.selected,
      required this.onTap})
      : super(key: key);

  YTColor get style => theme.colors.get(this.color);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: this.onTap,
      title: Text(
        this.title,
        style: theme.texts.body1
            .copyWith(color: this.selected ? theme.colors.foregroundColor : theme.colors.foregroundLightColor),
      ),
      leading: this.end ? null : this.widget,
      trailing: this.end ? this.widget : null,
    );
  }
}
