part of components;

class YCardLink extends StatefulWidget {
  final BorderRadius? borderRadius;
  final VoidCallback onTap;
  final IconData? icon;

  const YCardLink({Key? key, this.borderRadius, required this.onTap, this.icon}) : super(key: key);

  @override
  _YCardLinkState createState() => _YCardLinkState();
}

class _YCardLinkState extends State<YCardLink> {
  final double horizontalPadding = YScale.s4;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: widget.borderRadius,
      onTap: widget.onTap,
      child: Ink(
        padding: YPadding.p(horizontalPadding),
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
        ),
        child: Container(
          height: YScale.s6,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (widget.icon != null) Icon(widget.icon, color: theme.colors.primary.backgroundColor),
                  if (widget.icon != null) YHorizontalSpacer(horizontalPadding),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Useful links", style: theme.texts.link),
                      YHorizontalSpacer(YScale.s0p5),
                      Icon(
                        Icons.arrow_forward,
                        size: theme.texts.link.fontSize,
                        color: theme.colors.primary.backgroundColor,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
