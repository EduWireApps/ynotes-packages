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

  YTColor get style => theme.colors.get(color);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: theme.texts.body1
            .copyWith(color: selected ? theme.colors.foregroundColor : theme.colors.foregroundLightColor),
      ),
      leading: end ? null : widget,
      trailing: end ? widget : null,
    );
  }
}
