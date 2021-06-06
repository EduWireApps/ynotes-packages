import 'package:flutter/material.dart';
import 'package:ynotes_components/components/y_confirmation_dialog.dart';

mixin YDialogMixin<T extends StatefulWidget> on State<T> {
  Future<bool> getChoice(YConfirmationDialog dialog) async {
    return await showDialog(
        barrierDismissible: false, context: context, builder: (_) => dialog);
  }
}
