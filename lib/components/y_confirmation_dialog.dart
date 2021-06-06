import 'package:flutter/material.dart';
import 'package:ynotes_components/components/y_button.dart';
import 'package:ynotes_components/constants.dart';

enum YConfirmationDialogType { danger, success }

class YConfirmationDialog extends StatefulWidget {
  final YButtonType type;
  final String title;
  final String description;

  const YConfirmationDialog(
      {Key? key,
      this.type = YButtonType.danger,
      this.title = "Attention",
      this.description = "Etes-vous sûr de vouloir faire ça ?"})
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
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
            SizedBox(
              height: 10,
            ),
            Text(widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24)),
            SizedBox(
              height: 5,
            ),
            Text(widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(color: colors["neutral"][700])),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: YButton(
                      onPressed: () => Navigator.pop(context, false),
                      text: "Annuler",
                      type: YButtonType.neutral,
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
