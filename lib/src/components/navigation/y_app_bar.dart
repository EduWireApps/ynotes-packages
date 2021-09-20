part of components;

// TODO: document
class YAppBarLeading {
  final IconData icon;
  final VoidCallback? onPressed;
  final bool openDrawer;

  YAppBarLeading({required this.icon, this.onPressed, this.openDrawer = true});
}

class YAppBar extends StatefulWidget {
  final List<Widget>? actions;
  final YAppBarLeading leading;

  const YAppBar({Key? key, this.actions, required this.leading}) : super(key: key);

  @override
  _YAppBarState createState() => _YAppBarState();
}

class _YAppBarState extends State<YAppBar> {
  @override
  Widget build(BuildContext context) {
    const double borderHeight = 1.5;
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.colors.backgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: theme.isDark ? Brightness.dark : Brightness.light,
        ),
        centerTitle: false,
        iconTheme: IconThemeData(color: theme.colors.foregroundColor),
        leading: YIconButton(
            onPressed: widget.leading.openDrawer
                ? () {
                    Scaffold.of(context).openDrawer();
                  }
                : widget.leading.onPressed ?? () {},
            icon: widget.leading.icon),
        title: Text('Accueil',
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
                const YLinearProgressBar(
                    // value: 10,
                    )
              ],
            ),
            preferredSize: const Size.fromHeight(borderHeight + 5)));
  }
}
