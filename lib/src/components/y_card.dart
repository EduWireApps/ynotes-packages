part of components;

class YCardLink extends StatefulWidget {
  const YCardLink({Key? key}) : super(key: key);

  @override
  _YCardLinkState createState() => _YCardLinkState();
}

class _YCardLinkState extends State<YCardLink> {
  @override
  Widget build(BuildContext context) {
    return Container(height: 10, color: Colors.red);
  }
}

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

class YCard extends StatefulWidget {
  final YCardHeader? header;
  final YCardLink? bottomLink;
  final String? bottomCta;
  final VoidCallback? onTap;
  final Widget body;
  final EdgeInsets? padding;

  const YCard({Key? key, this.header, this.bottomLink, this.bottomCta, this.onTap, required this.body, this.padding})
      : assert(bottomLink == null || bottomCta == null, "Both bottomLink and bottomCta can't be used"),
        super(key: key);

  @override
  _YCardState createState() => _YCardState();
}

class _YCardState extends State<YCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: InkWell(
        borderRadius: YBorderRadius.lg,
        onTap: widget.onTap,
        child: Ink(
          width: double.infinity,
          decoration: BoxDecoration(
              color: theme.colors.backgroundLightColor,
              borderRadius: YBorderRadius.lg,
              boxShadow: [
                BoxShadow(offset: Offset(0, 2), blurRadius: 6, spreadRadius: 0, color: Colors.black.withOpacity(.2))
              ]),
          child: ClipRRect(
            borderRadius: YBorderRadius.lg,
            child: Column(
              children: [
                Padding(
                    padding: YPadding.p(YScale.s4),
                    child: Column(children: [
                      if (widget.header != null) widget.header!,
                      widget.body,
                    ])),
                if (widget.bottomCta != null)
                  Container(
                    height: YScale.s14,
                    color: theme.colors.primary.lightColor,
                    child: Center(
                      child: Text(widget.bottomCta!,
                          style: TextStyle(
                              color: theme.colors.primary.backgroundColor,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .5)),
                    ),
                  ),
                if (widget.bottomLink != null) widget.bottomLink!
              ],
            ),
          ),
        ),
      ),
    );
  }
}
