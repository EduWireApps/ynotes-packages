part of components;

class YDialogBase extends StatelessWidget {
  final String title;
  final Widget body;
  final List<YButton> actions;

  const YDialogBase({Key? key, required this.title, required this.body, required this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: YBorderRadius.lg,
        ),
        backgroundColor: theme.colors.backgroundLightColor,
        title: Text(this.title, style: theme.texts.title),
        content: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(child: this.body),
        ),
        actions: this.actions);
  }
}
