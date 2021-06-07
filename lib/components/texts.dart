import 'package:flutter/material.dart';
import 'package:ynotes_components/constants.dart';
import 'package:ynotes_components/mixins.dart';

class _YTextBase extends StatefulWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;

  const _YTextBase(this.text,
      {Key? key,
      required this.fontSize,
      required this.color,
      required this.fontWeight})
      : super(key: key);

  @override
  _YTextBaseState createState() => _YTextBaseState();
}

class _YTextBaseState extends State<_YTextBase> with YTextMixin {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
          color: widget.color,
          fontSize: rs(widget.fontSize),
          fontWeight: widget.fontWeight),
    );
  }
}

// ignore: non_constant_identifier_names
YH1(String text, {Color? color}) => _YTextBase(
      text,
      fontSize: 26,
      color: color ?? Color(0xff000000),
      fontWeight: FontWeight.w700,
    );

// ignore: non_constant_identifier_names
YH2(String text, {Color? color}) => _YTextBase(
      text,
      fontSize: 22,
      color: color ?? Color(0xff000000),
      fontWeight: FontWeight.w700,
    );

// ignore: non_constant_identifier_names
YH3(String text, {Color? color}) => _YTextBase(
      text,
      fontSize: 18,
      color: color ?? Color(0xff000000),
      fontWeight: FontWeight.w600,
    );

// ignore: non_constant_identifier_names
YTextBody(String text, {Color? color}) => _YTextBase(
      text,
      fontSize: 15,
      color: color ?? YColors.neutral[700],
      fontWeight: FontWeight.w400,
    );
