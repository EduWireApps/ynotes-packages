part of components;

class YDialogHeader extends StatefulWidget {
  final YColor type;
  final String title;
  final IconData icon;
  const YDialogHeader({Key? key, required this.type, required this.title, required this.icon}) : super(key: key);

  @override
  _YDialogHeaderState createState() => _YDialogHeaderState();
}

class _YDialogHeaderState extends State<YDialogHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: theme.colors.get(widget.type).shade200, borderRadius: BorderRadius.all(Radius.circular(120))),
          child: Icon(
            widget.icon,
            size: 30,
            color: theme.colors.get(widget.type).shade300,
          ),
        ),
        YVerticalSpacer(6),
        YH1(widget.title),
        YVerticalSpacer(1),
      ],
    );
  }
}
