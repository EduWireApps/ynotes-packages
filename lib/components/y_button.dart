import 'package:flutter/material.dart';
import 'package:ynotes_components/constants.dart';

class YButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final YStyleType type;
  final YStyleVariant variant;

  const YButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.type = YStyleType.primary,
      this.variant = YStyleVariant.plain})
      : super(key: key);

  @override
  _YButtonState createState() => _YButtonState();
}

class _YButtonState extends State<YButton> {
  final YUtils utils = new YUtils();

  @override
  Widget build(BuildContext context) {
    final String type = utils.enumToString(widget.type);
    final String variant = utils.enumToString(widget.variant);

    final Map c = {
      "plain": {
        "highlightColor": colors[type][600],
        "textColor": colors[type][50],
        "fillColor": colors[type][500]
      },
      "reverse": {
        "highlightColor": colors[type][200],
        "textColor": colors[type][600],
        "fillColor": colors[type][100]
      }
    };

    return RawMaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        elevation: 0.0,
        highlightElevation: 0.0,
        highlightColor: c[variant]["highlightColor"],
        onPressed: widget.onPressed,
        child: Text(widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                color: c[variant]["textColor"],
                fontWeight: FontWeight.w700)),
        fillColor: c[variant]["fillColor"],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))));
  }
}
