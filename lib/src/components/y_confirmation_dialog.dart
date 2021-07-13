part of components;

class YConfirmationDialog extends StatefulWidget {
  final YColor type;
  final String title;
  final String description;
  final IconData icon;
  final String buttonLabel;

  const YConfirmationDialog(
      {Key? key,
      required this.type,
      required this.title,
      required this.description,
      required this.icon,
      this.buttonLabel = "Confirmer"})
      : assert(type != YColor.neutral, "Neutral color can't be used in dialogs."),
        super(key: key);

  @override
  _YConfirmationDialogState createState() => _YConfirmationDialogState();
}

class _YConfirmationDialogState extends State<YConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    return YDialogBase(
      children: [
        YDialogHeader(type: widget.type, title: widget.title, icon: widget.icon),
        YTextBody(widget.description, align: TextAlign.center),
      ],
      bottomFixed: Row(
        children: [
          Expanded(
            child: YButton(onPressed: () => Navigator.pop(context), text: widget.buttonLabel, type: widget.type),
          ),
        ],
      ),
    );
  }
}
