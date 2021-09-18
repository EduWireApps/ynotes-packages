part of components;

/// A dialog that requires a choice from the user.
class YChoiceDialog extends StatelessWidget {
  /// The title of the dialog.
  final String title;

  /// The body of the dialog.
  final Widget body;

  /// The text to display for the cancel button. Defaults to _ANNULER_.
  final String cancelLabel;

  /// The text to display for the cancel button. Defaults to _CONFIRMR_.
  final String confirmLabel;

  /// The color of the elements of the dialog. Defaults to [YColor.primary].
  final YColor color;

  /// A dialog that requires a choice from the user.
  const YChoiceDialog(
      {Key? key,
      required this.title,
      required this.body,
      this.cancelLabel = "ANNULER",
      this.confirmLabel = "CONFIRMER",
      this.color = YColor.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YDialogBase(title: this.title, body: this.body, actions: [
      YButton(
          onPressed: () => Navigator.of(context).pop(false),
          text: this.cancelLabel,
          variant: YButtonVariant.text,
          color: this.color),
      YButton(
          onPressed: () => Navigator.of(context).pop(true),
          text: this.confirmLabel,
          variant: YButtonVariant.contained,
          color: this.color),
    ]);
  }
}
