import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'y_choice_dialog.dart';
import 'y_confirmation_dialog.dart';
import 'y_list_dialog.dart';
import 'y_list_multiple_dialog.dart';

// ignore: non_constant_identifier_names
Widget YVerticalSpacer(double h) => SizedBox(
      height: h.sp,
    );

// ignore: non_constant_identifier_names
Widget YHorizontalSpacer(double w) => SizedBox(
      width: w.sp,
    );

class YDialogs {
  YDialogs._();

  static Future<bool> getChoice(BuildContext context, YChoiceDialog dialog) async {
    return await showDialog(barrierDismissible: false, context: context, builder: (_) => dialog);
  }

  static Future<void> getConfirmation(BuildContext context, YConfirmationDialog dialog) async {
    return await showDialog(barrierDismissible: false, context: context, builder: (_) => dialog);
  }

  static Future<YListDialogElement?> getListChoice(BuildContext context, YListDialog dialog) async {
    return await showDialog(barrierDismissible: true, context: context, builder: (_) => dialog);
  }

  static Future<List<YListMultipleDialogElement>?> getListSelected(
      BuildContext context, YListMultipleDialog dialog) async {
    return await showDialog(barrierDismissible: false, context: context, builder: (_) => dialog);
  }
}
