part of components;

// TODO: document

/// WIP
class YAppBar extends StatefulWidget {
  final List<Widget>? actions;
  final YIconButton? leading;
  final bool removeLeading;
  final String title;
  final Widget? bottom;

  const YAppBar({
    Key? key,
    this.actions,
    this.leading,
    required this.title,
    this.bottom,
    this.removeLeading = false,
  }) : super(key: key);

  @override
  _YAppBarState createState() => _YAppBarState();
}

class _YAppBarState extends State<YAppBar> {
  @override
  Widget build(BuildContext context) {
    final ScaffoldState? scaffold = Scaffold.maybeOf(context);
    final bool hasDrawer = scaffold?.hasDrawer ?? false;

    Widget? leading() {
      if (widget.removeLeading) {
        return null;
      }
      if (widget.leading == null) {
        if (hasDrawer) {
          return YIconButton(icon: Icons.menu_rounded, onPressed: () => Scaffold.of(context).openDrawer());
        } else {
          return YIconButton(icon: Icons.west_rounded, onPressed: () => Navigator.maybePop(context));
        }
      } else {
        return widget.leading;
      }
    }

    final Widget? _leading = leading();
    return Material(
      color: theme.colors.backgroundColor,
      child: IconTheme(
        data: IconThemeData(color: theme.colors.foregroundColor),
        child: Column(children: [
          Padding(
            padding: YPadding.p(YScale.s2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_leading != null) _leading,
                if (_leading != null) YHorizontalSpacer(YScale.s6),
                Expanded(
                    child: Text(
                  widget.title,
                  style: theme.texts.title,
                  overflow: TextOverflow.ellipsis,
                )),
                YHorizontalSpacer(YScale.s2),
                if (widget.actions != null) Row(children: widget.actions!)
              ],
            ),
          ),
          if (widget.bottom != null) widget.bottom!,
          const YDivider()
        ]),
      ),
    );
  }
}
