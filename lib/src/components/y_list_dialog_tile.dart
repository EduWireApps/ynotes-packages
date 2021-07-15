part of components;

class YListDialogTile extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  final String? description;
  final Widget? leading;

  const YListDialogTile({Key? key, required this.onTap, required this.title, this.description, this.leading})
      : super(key: key);

  @override
  _YListDialogTileState createState() => _YListDialogTileState();
}

class _YListDialogTileState extends State<YListDialogTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: theme.colors.neutral.shade300,
        onTap: widget.onTap,
        child: ListTile(
          minVerticalPadding: YScale.s1p5,
          dense: true,
          title: Text(widget.title,
              style: TextStyle(
                  color: theme.colors.neutral.shade500, fontWeight: YFontWeight.semibold, fontSize: YFontSize.xl2)),
          subtitle: widget.description == null
              ? null
              : Text(widget.description!,
                  style: TextStyle(color: theme.colors.neutral.shade400, fontSize: YFontSize.lg)),
          leading: widget.leading,
        ));
  }
}

class YListDialogTileDivider extends StatefulWidget {
  const YListDialogTileDivider({Key? key}) : super(key: key);

  @override
  _YListDialogTileDividerState createState() => _YListDialogTileDividerState();
}

class _YListDialogTileDividerState extends State<YListDialogTileDivider> {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0.0,
      color: theme.colors.neutral.shade100,
    );
  }
}
