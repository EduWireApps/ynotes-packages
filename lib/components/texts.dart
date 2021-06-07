import 'package:flutter/material.dart';
import 'package:ynotes_components/mixins.dart';

class _YTextBase extends StatefulWidget {
  final String text;
  final double fontSize;
  final Color color;
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
          fontSize: rfs(widget.fontSize),
          fontWeight: widget.fontWeight),
    );
  }
}

// ignore: non_constant_identifier_names
YH1(String text, {Color color = const Color(0xff000000)}) => _YTextBase(
      text,
      fontSize: 24,
      color: color,
      fontWeight: FontWeight.w700,
    );
