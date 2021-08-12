part of components;

class YInfoDialog extends StatelessWidget {
  final String title;
  final Widget body;
  final String confirmLabel;
  final YColor color;

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
