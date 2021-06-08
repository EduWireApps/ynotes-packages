import 'package:flutter/material.dart';

import 'package:ynotes_components/components/base.dart';
import 'package:ynotes_components/components/texts.dart';
import 'package:ynotes_components/components/utils.dart';
import 'package:ynotes_components/components/y_button.dart';
import 'package:ynotes_components/theme/theme.dart';

class YConfirmationDialog extends StatefulWidget {
  final YColor type;
  final String title;
  final String description;
  final IconData icon;

  const YConfirmationDialog(
      {Key? key,
      required this.type,
      required this.title,
      required this.description,
      required this.icon})
      : super(key: key);

  @override
  _YConfirmationDialogState createState() => _YConfirmationDialogState();
}

class _YConfirmationDialogState extends State<YConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    return YDialogBase(children: [
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: currentTheme.c(widget.type)[100],
            borderRadius: BorderRadius.all(Radius.circular(120))),
        child: Icon(
          widget.icon,
          size: 30,
          color: currentTheme.c(widget.type)[600],
        ),
      ),
      VerticalSpacer(6),
      YH1(widget.title),
      VerticalSpacer(1),
      YTextBody(widget.description, align: TextAlign.center),
      VerticalSpacer(16),
      Row(
        children: [
          Expanded(
            child: YButton(
                onPressed: () => Navigator.pop(context),
                text: "Confirmer",
                type: widget.type),
          ),
        ],
      ),
    ]);
  }
}
