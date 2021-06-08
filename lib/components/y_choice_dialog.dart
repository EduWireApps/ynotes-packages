import 'package:flutter/material.dart';

import 'package:ynotes_components/components/base.dart';
import 'package:ynotes_components/components/texts.dart';
import 'package:ynotes_components/components/utils.dart';
import 'package:ynotes_components/components/y_button.dart';
import 'package:ynotes_components/theme/theme.dart';

class YChoiceDialog extends StatefulWidget {
  final YColor type;
  final String title;
  final String description;
  final IconData? icon;

  const YChoiceDialog(
      {Key? key,
      this.type = YColor.danger,
      this.title = "Attention",
      this.description = "Etes-vous sûr de vouloir faire ça ?",
      this.icon = Icons.error_outline})
      : super(key: key);

  @override
  _YChoiceDialogState createState() => _YChoiceDialogState();
}

class _YChoiceDialogState extends State<YChoiceDialog> {
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
                onPressed: () => Navigator.pop(context, false),
                text: "Annuler",
                type: YColor.neutral,
                variant: YButtonVariant.reverse),
          ),
          HorizontalSpacer(6),
          Expanded(
            child: YButton(
                onPressed: () => Navigator.pop(context, true),
                text: "Confirmer",
                type: widget.type),
          ),
        ],
      ),
    ]);
  }
}
