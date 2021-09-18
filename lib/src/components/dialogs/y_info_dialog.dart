part of components;

/// A dialog to inform the user about something.
class YInfoDialog extends StatelessWidget {
  /// the title of the dialog.
  final String title;

  /// The body of the dialog.
  final Widget body;

  /// The text to display for the cancel button. Defaults to _CONFIRMR_.
  final String confirmLabel;

  /// The color of the elements of the dialog. Defaults to [YColor.primary].
  final YColor color;

  /// A dialog to inform the user about something.
  const YInfoDialog(
      {Key? key, required this.title, required this.body, this.confirmLabel = "CONFIRMER", this.color = YColor.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YDialogBase(title: this.title, body: this.body, actions: [
      YButton(
          onPressed: () => Navigator.of(context).pop(true),
          text: this.confirmLabel,
          variant: YButtonVariant.contained,
          color: this.color),
    ]);
  }
}
