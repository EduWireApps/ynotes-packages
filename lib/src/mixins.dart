import 'package:flutter/material.dart';

import 'components/y_choice_dialog.dart';
import 'components/y_confirmation_dialog.dart';

mixin YDialogMixin<T extends StatefulWidget> on State<T> {
  Future<bool> getChoice(YChoiceDialog dialog) async {
    return await showDialog(barrierDismissible: false, context: context, builder: (_) => dialog);
  }

  Future<void> getConfirmation(YConfirmationDialog dialog) async {
    return await showDialog(barrierDismissible: false, context: context, builder: (_) => dialog);
  }
}
