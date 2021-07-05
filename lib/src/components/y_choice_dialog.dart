import 'package:flutter/material.dart';

import '../components/base.dart';
import '../components/texts.dart';
import '../components/utils.dart';
import '../components/y_button.dart';
import '../theme/theme.dart';
import '../theme/colors.dart';

class YChoiceDialog extends StatefulWidget {
  final YColor type;
  final String title;
  final String description;
  final IconData icon;

  const YChoiceDialog(
      {Key? key, required this.type, required this.title, required this.description, required this.icon})
      : super(key: key);

  @override
  _YChoiceDialogState createState() => _YChoiceDialogState();
}

class _YChoiceDialogState extends State<YChoiceDialog> {
  Color get iconBackgroundColor {
    switch (widget.type) {
      case YColor.neutral:
        return currentTheme.colors.get(widget.type).shade400;
      default:
        return currentTheme.colors.get(widget.type).shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return YDialogBase(children: [
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: iconBackgroundColor, borderRadius: BorderRadius.all(Radius.circular(120))),
        child: Icon(
          widget.icon,
          size: 30,
          color: currentTheme.colors.get(widget.type).shade300,
        ),
      ),
      YVerticalSpacer(6),
      YH1(widget.title),
      YVerticalSpacer(1),
      YTextBody(widget.description, align: TextAlign.center),
      YVerticalSpacer(16),
      Row(
        children: [
          Expanded(
            child: YButton(
                onPressed: () => Navigator.pop(context, false),
                text: "Annuler",
                type: YColor.neutral,
                variant: YButtonVariant.reverse),
          ),
          YHorizontalSpacer(6),
          Expanded(
            child: YButton(onPressed: () => Navigator.pop(context, true), text: "Confirmer", type: widget.type),
          ),
        ],
      ),
    ]);
  }
}
