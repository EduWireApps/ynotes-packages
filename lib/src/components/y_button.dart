part of components;

class YButton extends StatefulWidget {
  final VoidCallback onPressed;
  final VoidCallback? onLongPressed;
  final String text;
  final YColor type;
  final YButtonVariant variant;
  final IconData? icon;
  final bool isLoading;
  final bool isDisabled;
  final bool isIconReversed;

  const YButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.onLongPressed,
      this.type = YColor.primary,
      this.variant = YButtonVariant.plain,
      this.icon,
      this.isLoading = false,
      this.isDisabled = false,
      this.isIconReversed = false})
      : super(key: key);
  @override
  _YButtonState createState() => _YButtonState();
}

enum YButtonVariant { plain, reverse }

class _YButtonState extends State<YButton> with TickerProviderStateMixin {
  YTButtonStyleColors get style => theme.buttonStyles.get(widget.type).get(widget.variant);

  Color get highlightColor => style.highlight;
  Color get backgroundColor => style.background;
  Color get textColor => style.text;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.isDisabled ? 0.75 : 1,
      child: RawMaterialButton(
          padding: EdgeInsets.symmetric(horizontal: YScale.s4, vertical: YScale.s2),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: 0,
          highlightElevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          highlightColor: widget.isLoading || widget.isDisabled ? null : highlightColor,
          onPressed: widget.isLoading || widget.isDisabled ? null : widget.onPressed,
          onLongPress: widget.isLoading || widget.isDisabled ? null : widget.onLongPressed,
          child: AnimatedSize(
            vsync: this,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeOut,
            child: widget.isLoading
                ? SizedBox(
                    width: YScale.s4,
                    height: YScale.s4,
                    child: CircularProgressIndicator(
                        strokeWidth: YScale.s0p5, valueColor: AlwaysStoppedAnimation<Color>(textColor)),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    textDirection: widget.isIconReversed ? TextDirection.rtl : TextDirection.ltr,
                    children: [
                      if (widget.icon != null)
                        Icon(
                          widget.icon,
                          color: textColor,
                          size: YScale.s4,
                        ),
                      if (widget.icon != null)
                        SizedBox(
                          width: YScale.s2,
                        ),
                      Flexible(
                        child: Text(widget.text,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: textColor, fontWeight: YFontWeight.medium, fontSize: YFontSize.lg)),
                      ),
                    ],
                  ),
          ),
          fillColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: YBorderRadius.lg,
          )),
    );
  }
}
