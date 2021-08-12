part of components;

class YDialogs {
  YDialogs._();

  static Future<bool> getChoice(BuildContext context, YChoiceDialog dialog) async {
    return await showDialog(barrierDismissible: false, context: context, builder: (_) => dialog);
  }

  static Future<void> showInfo(BuildContext context, YInfoDialog dialog) async {
    return await showDialog(barrierDismissible: false, context: context, builder: (_) => dialog);
  }

  static Future<T?> getConfirmation<T>(BuildContext context, YConfirmationDialog<T> dialog) async {
    return await showDialog(barrierDismissible: true, context: context, builder: (_) => dialog);
  }
/*
  static Future<List<YListMultipleDialogElement>?> getListSelected(
      BuildContext context, YListMultipleDialog dialog) async {
    return await showDialog(barrierDismissible: false, context: context, builder: (_) => dialog);
  }*/
}
