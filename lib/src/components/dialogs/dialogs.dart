part of components;

/// A class that makes using default dialogs easier.
class YDialogs {
  YDialogs._();

  /// Shows a dialog that requires a choice from the user. It can't be dismissed.
  static Future<bool> getChoice(BuildContext context, YChoiceDialog dialog) async {
    return await showDialog(barrierDismissible: false, context: context, builder: (_) => dialog);
  }

  /// Shows a dialog to inform the user about something. It can't be dismissed.
  static Future<void> showInfo(BuildContext context, YInfoDialog dialog) async {
    return await showDialog(barrierDismissible: false, context: context, builder: (_) => dialog);
  }

  /// Shows a dialog to make the user choose one option from a list of options. It can be dismissed.
  static Future<T?> getConfirmation<T>(BuildContext context, YConfirmationDialog<T> dialog) async {
    return await showDialog(barrierDismissible: true, context: context, builder: (_) => dialog);
  }

  /// Shows a dialog to make the user choose one or several options from a list of options. It can be dismissed.
  static Future<List<YListDialogOption>?> getList(BuildContext context, YListDialog dialog) async {
    return await showDialog(barrierDismissible: true, context: context, builder: (_) => dialog);
  }
}
