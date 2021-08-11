part of components;

class YCardHeader extends StatefulWidget {
  final IconData? icon;
  final Widget title;
  final Color? color;
  final List<IconButton>? actions;

  const YCardHeader({Key? key, this.icon, required this.title, this.color, this.actions}) : super(key: key);

  @override
  _YCardHeaderState createState() => _YCardHeaderState();
}

class _YCardHeaderState extends State<YCardHeader> {
  Color get color => widget.color ?? theme.colors.foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  color: color,
                  size: theme.texts.title.fontSize,
                ),
              if (widget.icon != null) YHorizontalSpacer(YScale.s2),
              widget.title,
              Expanded(
                child: Container(),
              ),
              if (widget.actions != null) ...widget.actions!
            ],
          ),
        ),
        YVerticalSpacer(YScale.s2)
      ],
    );
  }
}
