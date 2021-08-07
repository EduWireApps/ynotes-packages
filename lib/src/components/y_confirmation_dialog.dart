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
      : super(key: key);

  @override
  _YConfirmationDialogState createState() => _YConfirmationDialogState();
}

class _YConfirmationDialogState extends State<YConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    return YDialogBase(
      topFixed: YDialogHeader(type: widget.type, title: widget.title, icon: widget.icon),
      children: [
        YDialogTextBody(widget.description),
      ],
      bottomFixed: Row(
        children: [
          Expanded(
            child: YButton(onPressed: () => Navigator.pop(context), text: widget.buttonLabel, color: widget.type),
          ),
        ],
      ),
    );
  }
}
