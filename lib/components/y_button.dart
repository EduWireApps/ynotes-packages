import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:ynotes_components/components/utils.dart';
import 'package:ynotes_components/theme/theme.dart';

class YButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final YColor type;
  final YButtonVariant variant;
  final IconData? icon;
  final bool isLoading;
  final bool isDisabled;

  const YButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.type = YColor.primary,
      this.variant = YButtonVariant.plain,
      this.icon,
      this.isLoading = false,
      this.isDisabled = false})
      : super(key: key);
  @override
  _YButtonState createState() => _YButtonState();
}

enum YButtonVariant { plain, reverse }

class _YButtonState extends State<YButton> with TickerProviderStateMixin {
  get highlightColor {
    switch (widget.variant) {
      case YButtonVariant.plain:
        return currentTheme.c(widget.type)[600];
      case YButtonVariant.reverse:
        return currentTheme.c(widget.type)[200];
    }
  }

  get textColor {
    switch (widget.variant) {
      case YButtonVariant.plain:
        return currentTheme.c(widget.type)[50];
      case YButtonVariant.reverse:
        return currentTheme.c(widget.type)[600];
    }
  }

  get fillColor {
    switch (widget.variant) {
      case YButtonVariant.plain:
        return currentTheme.c(widget.type)[500];
      case YButtonVariant.reverse:
        return currentTheme.c(widget.type)[100];
    }
  }

  @override
  Widget build(BuildContext context) {
    final double fontSize = 12;

    return Opacity(
      opacity: widget.isDisabled ? 0.5 : 1,
      child: RawMaterialButton(
          padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 4.sp),
          elevation: 0,
          highlightElevation: 0,
          highlightColor:
              widget.isLoading || widget.isDisabled ? null : highlightColor,
          onPressed:
              widget.isLoading || widget.isDisabled ? null : widget.onPressed,
          child: AnimatedSize(
            vsync: this,
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: widget.isLoading
                ? SizedBox(
                    width: fontSize + 4,
                    height: fontSize + 4,
                    child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(textColor)),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.icon != null)
                        Icon(
                          widget.icon,
                          color: textColor,
                          size: (fontSize + 4).sp,
                        ),
                      if (widget.icon != null)
                        HorizontalSpacer(
                          6,
                        ),
                      Flexible(
                        child: Text(widget.text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w700,
                                fontSize: fontSize.sp)),
                      ),
                    ],
                  ),
          ),
          fillColor: fillColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
