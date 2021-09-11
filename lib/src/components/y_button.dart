part of components;

enum YButtonVariant { contained, outlined, text }
enum YButtonSize { medium, large }

// Stateful to use TickerProviderStateMixin
class YButton extends StatefulWidget {
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final String text;
  final YColor color;
  final YButtonVariant variant;
  final YButtonSize size;
  final IconData? icon;
  final bool isLoading;
  final bool isDisabled;
  final bool isIconReversed;
  final bool block;
  final bool rounded;

  const YButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.onLongPress,
      this.color = YColor.primary,
      this.variant = YButtonVariant.contained,
      this.size = YButtonSize.medium,
      this.icon,
      this.isLoading = false,
      this.isDisabled = false,
      this.isIconReversed = false,
      this.block = false,
      this.rounded = false})
      : super(key: key);
  @override
  _YButtonState createState() => _YButtonState();
}

class _YButtonState extends State<YButton> with TickerProviderStateMixin {
  YTColor get style => theme.colors.get(widget.color);

  EdgeInsets get padding {
    late double h;
    late double v;
    switch (widget.size) {
      case YButtonSize.medium:
        h = YScale.s6;
        v = YScale.s3;
        break;
      case YButtonSize.large:
        h = YScale.s8;
        v = YScale.s4;
        break;
    }

    return EdgeInsets.symmetric(horizontal: h, vertical: v);
  }

  double get fontSize {
    late double fs;
    switch (widget.size) {
      case YButtonSize.medium:
        fs = YFontSize.sm;
        break;
      case YButtonSize.large:
        fs = YFontSize.xl;
        break;
    }
    return fs;
  }

  double get iconSize {
    late double s;
    switch (widget.size) {
      case YButtonSize.medium:
        s = YScale.s4;
        break;
      case YButtonSize.large:
        s = YScale.s6;
        break;
    }
    return s;
  }

  Size get minimumSize {
    late double w;
    late double h;
    switch (widget.size) {
      case YButtonSize.medium:
        w = YScale.s20;
        h = YScale.s12;
        break;
      case YButtonSize.large:
        w = YScale.s24;
        h = YScale.s16;
        break;
    }
    return Size(w, h);
  }

  double get loaderSize {
    late double s;
    switch (widget.size) {
      case YButtonSize.medium:
        s = YScale.s4;
        break;
      case YButtonSize.large:
        s = YScale.s6;
        break;
    }
    return s;
  }

  bool get isDisabled => widget.isDisabled || widget.isLoading;

  Color get foregroundColor => style.foregroundColor.withOpacity(isDisabled ? .75 : 1);
  Color get backgroundColor => style.backgroundColor.withOpacity(isDisabled ? .5 : 1);

  MaterialStateProperty<OutlinedBorder> get shape => MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: widget.rounded ? YBorderRadius.full : YBorderRadius.lg,
      ));

  Widget buttonContent(BuildContext context, Color loaderColor) => Row(
        mainAxisSize: MainAxisSize.min,
        textDirection: widget.isIconReversed ? TextDirection.rtl : TextDirection.ltr,
        children: [
          if (!isDisabled && widget.icon != null)
            Icon(
              widget.icon,
              size: iconSize,
            ),
          if (!isDisabled && widget.icon != null)
            YHorizontalSpacer(
              YScale.s2,
            ),
          Flexible(
            child: widget.isLoading
                ? SizedBox(
                    width: loaderSize,
                    height: loaderSize,
                    child: CircularProgressIndicator(
                        strokeWidth: YScale.s0p5, valueColor: AlwaysStoppedAnimation<Color>(loaderColor)),
                  )
                : Text(
                    widget.text,
                    style: theme.texts.button,
                  ),
          ),
        ],
      );

  Widget containedButton(BuildContext context) => ElevatedButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(minimumSize),
            foregroundColor: MaterialStateProperty.all(foregroundColor),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            padding: MaterialStateProperty.all(padding),
            shape: shape,
            textStyle: MaterialStateProperty.all(TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                letterSpacing: YLetterSpacing.wider,
                fontFamily: theme.fonts.secondary))),
        onPressed: isDisabled ? null : widget.onPressed,
        onLongPress: isDisabled ? null : widget.onLongPress,
        child: buttonContent(context, foregroundColor),
      );

  Widget outlinedButton(BuildContext context) => OutlinedButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(minimumSize),
            foregroundColor: MaterialStateProperty.all(backgroundColor),
            overlayColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              const Set<MaterialState> interactiveStates = <MaterialState>{
                MaterialState.pressed,
                MaterialState.hovered,
                MaterialState.focused,
              };
              if (states.any(interactiveStates.contains)) {
                return backgroundColor.withOpacity(.1);
              }
              return null;
            }),
            padding: MaterialStateProperty.all(padding),
            side: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              const Set<MaterialState> interactiveStates = <MaterialState>{
                MaterialState.pressed,
                MaterialState.hovered,
                MaterialState.focused,
              };
              double opacity = .7;
              if (states.any(interactiveStates.contains)) {
                opacity = 1;
              }
              return BorderSide(color: backgroundColor.withOpacity(opacity), width: YScale.s0p5);
            }),
            shape: shape,
            textStyle: MaterialStateProperty.all(TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                letterSpacing: YLetterSpacing.wider,
                fontFamily: theme.fonts.secondary))),
        onPressed: isDisabled ? null : widget.onPressed,
        onLongPress: isDisabled ? null : widget.onLongPress,
        child: buttonContent(context, backgroundColor),
      );

  Widget textButton(BuildContext context) => TextButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(minimumSize),
            foregroundColor: MaterialStateProperty.all(backgroundColor),
            overlayColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              const Set<MaterialState> interactiveStates = <MaterialState>{
                MaterialState.pressed,
                MaterialState.hovered,
                MaterialState.focused,
              };
              if (states.any(interactiveStates.contains)) {
                return backgroundColor.withOpacity(.1);
              }
              return null;
            }),
            padding: MaterialStateProperty.all(padding),
            shape: shape,
            textStyle: MaterialStateProperty.all(TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                letterSpacing: YLetterSpacing.wider,
                fontFamily: theme.fonts.secondary))),
        onPressed: isDisabled ? null : widget.onPressed,
        onLongPress: isDisabled ? null : widget.onLongPress,
        child: buttonContent(context, backgroundColor),
      );

  Widget button(BuildContext context) {
    switch (widget.variant) {
      case YButtonVariant.contained:
        return containedButton(context);
      case YButtonVariant.outlined:
        return outlinedButton(context);
      case YButtonVariant.text:
        return textButton(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.block
        ? Row(
            children: [
              Expanded(
                child: button(context),
              )
            ],
          )
        : button(context);
  }
}
