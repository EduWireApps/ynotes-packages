part of components;

class YChoiceDialog extends StatelessWidget {
  final String title;
  final Widget body;
  final String cancelLabel;
  final String confirmLabel;
  final YColor color;

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
