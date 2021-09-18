part of components;

/// A component to be used as a base for dialogs.
class YDialogBase extends StatelessWidget {
  /// The title of the dialog.
  final String title;

  /// The body of the dialog.
  final Widget body;

  /// The actions to be displayed at the bottom of the dialog.
  ///
  /// The right one is usually of type [YButtonVariant.contained] and the others [YButtonVariant.text].
  final List<YButton>? actions;

  /// The horizontal padding of the content of the dialog.
  final bool horizontalPadding;

  /// A component to be used as a base for dialogs.
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
