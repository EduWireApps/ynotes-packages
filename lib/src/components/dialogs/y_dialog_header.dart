part of components;

class YDialogHeader extends StatefulWidget {
  final YColor type;
  final String title;
  final IconData icon;
  const YDialogHeader({Key? key, required this.type, required this.title, required this.icon}) : super(key: key);

  @override
  _YDialogHeaderState createState() => _YDialogHeaderState();
}

class _YDialogHeaderState extends State<YDialogHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: YPadding.p(YScale.s3),
          decoration: BoxDecoration(
              color: theme.colors.get(widget.type).backgroundColor.withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(120))),
          child: Icon(
            widget.icon,
            size: YScale.s10,
            color: theme.colors.get(widget.type).backgroundColor,
          ),
        ),
        YVerticalSpacer(YScale.s3),
        Text(
          widget.title,
          style:
              TextStyle(color: theme.colors.foregroundColor, fontWeight: YFontWeight.semibold, fontSize: YFontSize.xl3),
        ),
        // YH1(widget.title),
        YVerticalSpacer(1),
      ],
    );
  }
}
