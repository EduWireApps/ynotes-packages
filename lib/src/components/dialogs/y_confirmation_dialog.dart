part of components;

class YConfirmationDialog extends StatelessWidget {
  final String title;
  final Widget body;
  final String confirmLabel;

  const YConfirmationDialog({Key? key, required this.title, required this.body, this.confirmLabel = "CONFIRMER"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YDialogBase(title: this.title, body: this.body, actions: [
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
