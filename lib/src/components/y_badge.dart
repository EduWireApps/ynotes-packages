part of components;

class YBadge extends StatelessWidget {
  final String text;
  final YColor color;

  const YBadge({Key? key, required this.text, this.color = YColor.primary}) : super(key: key);

  YTColor get _color => theme.colors.get(color);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: YScale.s1, horizontal: YScale.s2),
        decoration: BoxDecoration(color: _color.backgroundColor, borderRadius: YBorderRadius.full),
        child: Text(text,
            style: TextStyle(color: _color.foregroundColor, fontWeight: YFontWeight.semibold, fontSize: YFontSize.sm)));
  }
}
