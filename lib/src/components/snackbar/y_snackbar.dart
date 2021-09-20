part of components;

class YSnackBar {
  final BuildContext context;
  final String title;
  final String message;
  final YColor color;
  final bool isDismissible;
  final IconData? icon;
  final YSnackbarAction? action;

  const YSnackBar(this.context,
      {required this.title,
      required this.message,
      this.color = YColor.primary,
      this.isDismissible = false,
      this.icon,
      this.action});

  YTColor get _style => theme.colors.get(color);

  Flushbar get _snackbar => Flushbar(
        margin: YPadding.p(YScale.s4),
        borderRadius: YBorderRadius.lg,
        padding: EdgeInsets.symmetric(horizontal: YScale.s5, vertical: YScale.s3),
        flushbarPosition: FlushbarPosition.BOTTOM,
        flushbarStyle: FlushbarStyle.FLOATING,
        backgroundColor: _style.backgroundColor,
        boxShadows: [
          BoxShadow(
              offset: Offset(0, YScale.s1),
              blurRadius: YScale.s1p5,
              spreadRadius: -1,
              color: Colors.black.withOpacity(.1)),
          BoxShadow(
              offset: Offset(0, YScale.s0p5),
              blurRadius: YScale.s1,
              spreadRadius: -1,
              color: Colors.black.withOpacity(.06)),
        ],
        isDismissible: isDismissible,
        duration: const Duration(seconds: 3),
        shouldIconPulse: false,
        icon: icon != null
            ? Icon(
                icon,
                size: YFontSize.xl3,
                color: _style.foregroundColor,
              )
            : null,
        mainButton: action != null
            ? YButton(
                onPressed: action!.onPressed,
                text: action!.text,
                variant: YButtonVariant.text,
                color: color,
                invertColors: true)
            : null,
        titleText: Text(
          title,
          style: theme.texts.title.copyWith(color: _style.foregroundColor),
        ),
        messageText: Text(
          message,
          style: theme.texts.body1.copyWith(color: _style.foregroundColor),
        ),
      );

  void show() => _snackbar..show(context);
}

/// The action to use in [showSnackbar] as [action].
/// Will be used for an [YButton] with [YButtonVariant.text].
class YSnackbarAction {
  /// The text to display in the action.
  final String text;

  /// The action to execute when the action is clicked.
  final VoidCallback onPressed;

  /// The action to use in [showSnackbar] as [action].
  const YSnackbarAction({required this.text, required this.onPressed});
}
