import 'package:flutter/material.dart';
import 'package:ynotes_components/constants.dart';

import 'package:sizer/sizer.dart';

class _YTextBase extends StatefulWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final TextStyle? style;
  final TextAlign? align;

  const _YTextBase(this.text,
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

class _YTextBaseState extends State<_YTextBase> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        textAlign: widget.align,
        style: TextStyle(
                color: widget.color,
                fontSize: widget.fontSize.sp,
                fontWeight: widget.fontWeight)
            .merge(widget.style));
  }
}

// ignore: non_constant_identifier_names
YH1(String text, {Color? color, TextStyle? style, TextAlign? align}) =>
    _YTextBase(text,
        fontSize: 22,
        color: color ?? Color(0xff000000),
        fontWeight: FontWeight.w700,
        style: style,
        align: align);

// ignore: non_constant_identifier_names
YH2(String text, {Color? color, TextStyle? style, TextAlign? align}) =>
    _YTextBase(text,
        fontSize: 18,
        color: color ?? Color(0xff000000),
        fontWeight: FontWeight.w700,
        style: style,
        align: align);

// ignore: non_constant_identifier_names
YH3(String text, {Color? color, TextStyle? style, TextAlign? align}) =>
    _YTextBase(text,
        fontSize: 14,
        color: color ?? Color(0xff000000),
        fontWeight: FontWeight.w600,
        style: style,
        align: align);

// ignore: non_constant_identifier_names
YTextBody(String text, {Color? color, TextStyle? style, TextAlign? align}) =>
    _YTextBase(text,
        fontSize: 11,
        color: color ?? YColors.neutral[700],
        fontWeight: FontWeight.w400,
        style: style,
        align: align);
