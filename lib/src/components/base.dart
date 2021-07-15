part of components;

class YTextBase extends StatefulWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final TextStyle? style;
  final TextAlign? align;

  const YTextBase(this.text,
      {Key? key,
      required this.fontSize,
      required this.color,
      required this.fontWeight,
      this.style = const TextStyle(),
      this.align = TextAlign.left})
      : super(key: key);

  @override
  _YTextBaseState createState() => _YTextBaseState();
}

class _YTextBaseState extends State<YTextBase> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        textAlign: widget.align,
        style: TextStyle(color: widget.color, fontSize: widget.fontSize.sp, fontWeight: widget.fontWeight)
            .merge(widget.style));
  }
}

class YDialogBase extends StatefulWidget {
  final List<Widget> children;
  final Widget? topFixed;
  final Widget? bottomFixed;

  const YDialogBase({Key? key, required this.children, this.topFixed, this.bottomFixed}) : super(key: key);

  @override
  _YDialogBaseState createState() => _YDialogBaseState();
}

class _YDialogBaseState extends State<YDialogBase> {
  final Color backgroundColor = theme.colors.neutral.shade200;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      content: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 75.h.clamp(0, 500), maxWidth: 90.w.clamp(0, 500)),
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 14.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.topFixed != null)
                Padding(
                  padding: EdgeInsets.only(bottom: 16.sp),
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
                  padding: EdgeInsets.only(top: 16.sp),
                  child: widget.bottomFixed!,
                )
            ],
          ),
        ),
      ),
    );
  }
}
