import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:ynotes_components/ynotes_components.dart';
import 'y_choice_dialog.dart';
import 'y_confirmation_dialog.dart';

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

  static Future<T?> getListChoice<T>(BuildContext context, YListDialog dialog) async {
    return await showDialog(barrierDismissible: true, context: context, builder: (_) => dialog);
  }
}
