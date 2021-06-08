import 'package:flutter/material.dart';
import 'package:ynotes_components/components/texts.dart';
import 'package:ynotes_components/components/utils.dart';
import 'package:ynotes_components/components/y_button.dart';
import 'package:ynotes_components/constants.dart';

import 'package:sizer/sizer.dart';

class YChoiceDialog extends StatefulWidget {
  final YColor type;
  final String title;
  final String description;

  const YChoiceDialog(
      {Key? key,
      this.type = YColor.danger,
      this.title = "Attention",
      this.description = "Etes-vous sûr de vouloir faire ça ?"})
      : super(key: key);

  @override
  _YChoiceDialogState createState() => _YChoiceDialogState();
}

class _YChoiceDialogState extends State<YChoiceDialog> {
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
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: colors[type][50],
                  borderRadius: BorderRadius.all(Radius.circular(120))),
              child: Icon(
                Icons.error_outline,
                size: 30,
                color: colors[type][500],
              ),
            ),
            VerticalSpacer(10),
            YH1(widget.title),
            VerticalSpacer(5),
            YTextBody(widget.description, align: TextAlign.center),
            VerticalSpacer(20),
            Row(
              children: [
                Expanded(
                  child: YButton(
                      onPressed: () => Navigator.pop(context, false),
                      text: "Annuler",
                      type: YColor.neutral,
                      variant: YButtonVariant.reverse),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: YButton(
                      onPressed: () => Navigator.pop(context, true),
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
