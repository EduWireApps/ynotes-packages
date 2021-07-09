import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../theme/theme.dart';
import '../theme/colors.dart';
import '../theme/button_styles.dart';
import '../components/utils.dart';

class YButton extends StatefulWidget {
  final VoidCallback onPressed;
  final VoidCallback? onLongPressed;
  final String text;
  final YColor type;
  final YButtonVariant variant;
  final IconData? icon;
  final bool isLoading;
  final bool isDisabled;
  final bool reverseIconAndText;

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
      this.reverseIconAndText = false})
      : super(key: key);
  @override
  _YButtonState createState() => _YButtonState();
}

enum YButtonVariant { plain, reverse }

class _YButtonState extends State<YButton> with TickerProviderStateMixin {
  YTButtonStyleColors get style => currentTheme.buttonStyles.get(widget.type).get(widget.variant);

  Color get highlightColor => style.highlight;
  Color get backgroundColor => style.background;
  Color get textColor => style.text;

  @override
  Widget build(BuildContext context) {
    final double fontSize = 12;

    return Opacity(
      opacity: widget.isDisabled ? 0.5 : 1,
      child: RawMaterialButton(
          padding: EdgeInsets.symmetric(horizontal: 13.sp.clamp(0.0, 15), vertical: 4.sp.clamp(0.0, 10)),
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
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: widget.isLoading
                ? SizedBox(
                    width: (fontSize + 4).sp.clamp(0.0, 21),
                    height: (fontSize + 4).sp.clamp(0.0, 21),
                    child:
                        CircularProgressIndicator(strokeWidth: 3, valueColor: AlwaysStoppedAnimation<Color>(textColor)),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.icon != null && !widget.reverseIconAndText)
                        Icon(
                          widget.icon,
                          color: textColor,
                          size: (fontSize + 4).sp.clamp(0.0, 21),
                        ),
                      if (widget.icon != null)
                        YHorizontalSpacer(
                          6,
                        ),
                      Flexible(
                        child: Text(widget.text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.w700, fontSize: fontSize.sp.clamp(0.0, 21))),
                      ),
                      if (widget.icon != null && widget.reverseIconAndText)
                        YHorizontalSpacer(
                          6,
                        ),
                      if (widget.icon != null && widget.reverseIconAndText)
                        Icon(
                          widget.icon,
                          color: textColor,
                          size: (fontSize + 4).sp.clamp(0.0, 21),
                        ),
                    ],
                  ),
          ),
          fillColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
