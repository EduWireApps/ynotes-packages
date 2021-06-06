import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ynotes_components/constants.dart';

class YButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final YButtonType type;
  final YButtonVariant variant;
  final IconData? icon;
  final bool isLoading;
  final bool isDisabled;

  const YButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.type = YButtonType.primary,
      this.variant = YButtonVariant.plain,
      this.icon,
      this.isLoading = false,
      this.isDisabled = false})
      : super(key: key);

  @override
  _YButtonState createState() => _YButtonState();
}

enum YButtonType { primary, secondary, success, warning, danger, neutral }

enum YButtonVariant { plain, reverse }

class _YButtonState extends State<YButton> with TickerProviderStateMixin {
  final YUtils utils = new YUtils();
  final double fontSize = 18;

  @override
  Widget build(BuildContext context) {
    final String type = widget.isDisabled ? "neutral" : utils.enumToString(widget.type);
    final String variant = utils.enumToString(widget.variant);

    final Map c = {
      "plain": {"highlightColor": colors[type][600], "textColor": colors[type][50], "fillColor": colors[type][500]},
      "reverse": {"highlightColor": colors[type][200], "textColor": colors[type][600], "fillColor": colors[type][100]}
    };

    // Color highlightColor() => colors[type][600];
    // Color textColor() => colors[type][50];
    // Color fillColor() => colors[type][100];

    return RawMaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        elevation: 0,
        highlightElevation: 0,
        highlightColor: widget.isLoading || widget.isDisabled ? null : c[variant]["highlightColor"],
        onPressed: widget.isLoading || widget.isDisabled ? null : widget.onPressed,
        child: AnimatedSize(
          vsync: this,
          duration: Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: widget.isLoading
              ? SizedBox(
                  width: this.fontSize + 4,
                  height: this.fontSize + 4,
                  child: CircularProgressIndicator(
                      strokeWidth: 3, valueColor: AlwaysStoppedAnimation<Color>(c[variant]["textColor"])),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.icon != null)
                      Icon(
                        widget.icon,
                        color: c[variant]["textColor"],
                        size: this.fontSize + 4,
                      ),
                    if (widget.icon != null)
                      SizedBox(
                        width: 10,
                      ),
                    Flexible(
                      child: AutoSizeText(widget.text,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(color: c[variant]["textColor"], fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
        ),
        fillColor: c[variant]["fillColor"],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))));
  }
}
