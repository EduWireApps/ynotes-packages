part of components;

// TODO: document
// TODO: use refresh indicator

class YAppBar extends StatefulWidget {
  final List<Widget>? actions;
  final YIconButton? leading;
  final String title;
  final Widget? bottom;

  const YAppBar({Key? key, this.actions, this.leading, required this.title, this.bottom}) : super(key: key);

  @override
  _YAppBarState createState() => _YAppBarState();
}

class _YAppBarState extends State<YAppBar> {
  @override
  Widget build(BuildContext context) {
    final ScaffoldState? scaffold = Scaffold.maybeOf(context);
    final bool hasDrawer = scaffold?.hasDrawer ?? false;

    Widget? leading() {
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

    const double borderHeight = 1.5;
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.colors.backgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: theme.isDark ? Brightness.dark : Brightness.light,
        ),
        centerTitle: false,
        iconTheme: IconThemeData(color: theme.colors.foregroundColor),
        leading: leading(),
        title: Text(widget.title,
            style: TextStyle(
                color: theme.colors.foregroundColor,
                fontWeight: YFontWeight.semibold,
                fontSize: YFontSize.xl,
                fontFamily: theme.fonts.primary)),
        elevation: 0,
        actions: widget.actions,
        bottom: PreferredSize(
            child: Column(
              children: [
                Container(height: borderHeight, color: theme.colors.backgroundLightColor),
                if (widget.bottom != null) widget.bottom!
              ],
            ),
            preferredSize: const Size.fromHeight(borderHeight)));
  }
}
