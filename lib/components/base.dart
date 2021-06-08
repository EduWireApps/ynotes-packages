import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:ynotes_components/theme/theme.dart';

class YTextBase extends StatefulWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final TextStyle? style;
  final TextAlign? align;

  const YTextBase(this.text,
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

class _YTextBaseState extends State<YTextBase> {
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

class YDialogBase extends StatefulWidget {
  final List<Widget> children;

  const YDialogBase({Key? key, required this.children}) : super(key: key);

  @override
  _YDialogBaseState createState() => _YDialogBaseState();
}

class _YDialogBaseState extends State<YDialogBase> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: currentTheme.c(YColor.neutral)[50],
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 14.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: widget.children,
        ),
      ),
    );
  }
}
