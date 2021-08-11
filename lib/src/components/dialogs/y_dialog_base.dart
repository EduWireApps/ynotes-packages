part of components;

class YDialogBase extends StatefulWidget {
  final List<Widget> children;
  final Widget? topFixed;
  final Widget? bottomFixed;

  const YDialogBase({Key? key, required this.children, this.topFixed, this.bottomFixed}) : super(key: key);

  @override
  _YDialogBaseState createState() => _YDialogBaseState();
}

class _YDialogBaseState extends State<YDialogBase> {
  final Color backgroundColor = theme.colors.backgroundColor;
  final double padding = YScale.s6;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: YBorderRadius.xl2),
      content: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: r<double>(def: 60.vh, sm: 40.rem), maxWidth: r<double>(def: 95.vw, sm: 30.rem)),
        child: Container(
          width: double.maxFinite,
          padding: YPadding.p(padding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.topFixed != null)
                Padding(
                  padding: YPadding.pb(padding),
                  child: widget.topFixed!,
                ),
              Flexible(
                child: YShadowScrollContainer(
                  children: [
                    Column(
                      children: widget.children,
                    )
                  ],
                  color: backgroundColor,
                  shrinkWrap: true,
                ),
              ),
              if (widget.bottomFixed != null)
                Padding(
                  padding: YPadding.pt(padding),
                  child: widget.bottomFixed!,
                )
            ],
          ),
        ),
      ),
    );
  }
}
