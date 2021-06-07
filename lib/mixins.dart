import 'package:flutter/material.dart';
import 'package:ynotes_components/components/y_choice_dialog.dart';

mixin YDialogMixin<T extends StatefulWidget> on State<T> {
  Future<bool> getChoice(YChoiceDialog dialog) async {
    return await showDialog(
        barrierDismissible: false, context: context, builder: (_) => dialog);
  }
}

mixin YTextMixin<T extends StatefulWidget> on State<T> {
  Size get screenSize => MediaQuery.of(context).size;
  num get screenRatio => screenSize.width / 400;

  // Relative Font Size
  double rs(double fontSize) => fontSize * screenRatio;
}
