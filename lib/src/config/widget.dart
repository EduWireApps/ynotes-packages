part of config;

typedef _YAppBuild = Widget Function(BuildContext context);

/// A widget that setups the flutter_responsive_breakpoints and theme packages.
///
/// Usage: Wrap MaterialApp with this widget.
class YApp extends StatefulWidget {
  final _YAppBuild builder;
  final List<YTheme> themes;
  final int initialTheme;
  const YApp({Key? key, required this.builder, required this.themes, required this.initialTheme}) : super(key: key);

  @override
  State<YApp> createState() => _YAppState();
}

class _YAppState extends State<YApp> {
  @override
  Widget build(BuildContext context) {
    theme = YCurrentTheme(currentTheme: widget.initialTheme, themes: widget.themes);
    return ChangeNotifierProvider.value(
      value: theme,
      child: Consumer<YCurrentTheme>(builder: (context, _, __) {
        final Key key = UniqueKey();
        return Responsive(
          key: key,
          builder: (context) => widget.builder(context),
        );
      }),
    );
  }
}
