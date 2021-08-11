part of components;

class YChoiceDialog extends StatelessWidget {
  final String title;
  final Widget body;
  final String cancelLabel;
  final String confirmLabel;

  const YChoiceDialog(
      {Key? key,
      required this.title,
      required this.body,
      this.cancelLabel = "ANNULER",
      this.confirmLabel = "CONFIRMER"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YDialogBase(title: this.title, body: this.body, actions: [
      YButton(
        onPressed: () {
          Navigator.of(context).pop(false);
        },
        text: this.cancelLabel,
        variant: YButtonVariant.text,
      ),
      YButton(
        onPressed: () {
          Navigator.of(context).pop(true);
        },
        text: this.confirmLabel,
        variant: YButtonVariant.contained,
      ),
    ]);
  }
}
