part of components;

class YDialogTextBody extends StatefulWidget {
  final String text;

  const YDialogTextBody(this.text, {Key? key}) : super(key: key);

  @override
  _YDialogTextBodyState createState() => _YDialogTextBodyState();
}

class _YDialogTextBodyState extends State<YDialogTextBody> {
  @override
  Widget build(BuildContext context) => Text(
        widget.text,
        style:
            TextStyle(color: theme.colors.foregroundLightColor, fontWeight: YFontWeight.normal, fontSize: YFontSize.xl),
        textAlign: TextAlign.center,
      );
}
