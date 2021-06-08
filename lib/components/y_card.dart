import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class YCard extends StatefulWidget {
  final Widget child;

  const YCard({Key? key, required this.child}) : super(key: key);

  @override
  _YCardState createState() => _YCardState();
}

class _YCardState extends State<YCard> {
  @override
  Widget build(BuildContext context) {
    final double spacing = 10.sp;

    return Container(
        padding: EdgeInsets.all(spacing),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(spacing))),
        child: widget.child);
  }
}
