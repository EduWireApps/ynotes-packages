import 'package:flutter/material.dart';
import 'package:ynotes_components/components/texts.dart';
import 'package:ynotes_components/components/utils.dart';
import 'package:ynotes_components/components/y_button.dart';
import 'package:ynotes_components/constants.dart';

import 'package:sizer/sizer.dart';

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
  final YUtils utils = new YUtils();

  @override
  Widget build(BuildContext context) {
    final String type = utils.enumToString(widget.type);

    return AlertDialog(
      backgroundColor: colors["neutral"][50],
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 14.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: colors[type][100],
                  borderRadius: BorderRadius.all(Radius.circular(120))),
              child: Icon(
                widget.icon,
                size: 30,
                color: colors[type][600],
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
          ],
        ),
      ),
    );
  }
}
