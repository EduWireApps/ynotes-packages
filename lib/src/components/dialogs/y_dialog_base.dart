part of components;

class YDialogBase extends StatelessWidget {
  final String title;
  final Widget body;
  final List<YButton>? actions;
  final bool horizontalPadding;

  const YDialogBase({Key? key, required this.title, required this.body, this.actions, this.horizontalPadding = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double padding = horizontalPadding ? YScale.s6 : 0;
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: YBorderRadius.lg,
        ),
        backgroundColor: theme.colors.backgroundLightColor,
        title: Text(this.title, style: theme.texts.title),
        contentPadding: EdgeInsets.fromLTRB(padding, YScale.s5, padding, YScale.s6),
        content: Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(child: this.body),
        ),
        actions: this.actions);
  }
}
