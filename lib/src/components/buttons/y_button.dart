part of components;

/// The variant of the [YButton] component.
enum YButtonVariant { contained, outlined, text }

/// The [YButton] size.
enum YButtonSize { medium, large }

/// A button component.
class YButton extends StatefulWidget {
  /// The action to perform when the button is pressed.
  final VoidCallback onPressed;

  /// The action to perform when the button is long pressed.
  final VoidCallback? onLongPress;

  /// The action to perform when the button is loading. If not provided,
  /// the button will be disabled.
  ///
  /// Can be used to inform the user must wait for an action to complete.
  final VoidCallback? onPressedLoading;

  /// The action to perform when the button is disabled. If not provided,
  /// the button will be disabled.
  ///
  /// Can be used to inform the user what are the reasons that make the button
  /// disabled.
  final VoidCallback? onPressedDisabled;

  /// The text to display on the button. Must be short.
  final String text;

  /// The color of the button, [YColor.primary] by default.
  final YColor color;

  /// The variant of the button, [YButtonVariant.contained] by default.
  final YButtonVariant variant;

  /// The size of the button, [YButtonSize.medium] by default.
  final YButtonSize size;

  /// The icon to display on the button, next to the [text].
  final IconData? icon;

  /// The condition to set the button's state to loading.
  final bool isLoading;

  /// The condition to set the button's state to disabled.
  final bool isDisabled;

  /// The condition to show the icon to the right of the text.
  final bool isIconReversed;

  /// The condition to make the button full width.
  ///
  /// Under the hood, we wrap the button with a [Row] and an [Expanded] widgets.
  final bool block;

  /// The condition to make the button rounded ([YBorderRadius.full]).
  final bool rounded;

  /// A button component.
  const YButton(
      {Key? key,
      required this.onPressed,
      this.onPressedDisabled,
      this.onPressedLoading,
      this.onLongPress,
      required this.text,
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

  VoidCallback? get onPressed {
    if (widget.isLoading) {
      return widget.onPressedLoading;
    } else if (widget.isDisabled) {
      return widget.onPressedDisabled;
    } else {
      return widget.onPressed;
    }
  }

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
        onPressed: onPressed,
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
        onPressed: onPressed,
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
        onPressed: onPressed,
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
