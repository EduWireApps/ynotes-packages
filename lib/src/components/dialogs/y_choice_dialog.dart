part of components;

class YChoiceDialog extends StatefulWidget {
  final YColor type;
  final String title;
  final String description;
  final IconData icon;

  const YChoiceDialog(
      {Key? key, required this.type, required this.title, required this.description, required this.icon})
      : super(key: key);

  @override
  _YChoiceDialogState createState() => _YChoiceDialogState();
}

class _YChoiceDialogState extends State<YChoiceDialog> {
  @override
  Widget build(BuildContext context) {
    return YDialogBase(children: [
      YDialogHeader(type: widget.type, title: widget.title, icon: widget.icon),
      YDialogTextBody(widget.description),
      YVerticalSpacer(YScale.s4),
      Row(
        children: [
          Expanded(
            child: YButton(
                onPressed: () => Navigator.pop(context, false),
                text: "Annuler",
                color: YColor.primary,
                variant: YButtonVariant.text),
          ),
          YHorizontalSpacer(YScale.s2),
          Expanded(
            child: YButton(onPressed: () => Navigator.pop(context, true), text: "Confirmer", color: widget.type),
          ),
        ],
      ),
    ]);
  }
}
