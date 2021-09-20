part of config;

typedef _YAppBuild = Widget Function(BuildContext context);

/// A widget that setups the flutter_responsive_breakpoints and theme packages.
///
/// Usage: Wrap MaterialApp with this widget.
class YApp extends StatelessWidget {
  final _YAppBuild builder;
  final List<YTheme> themes;
  final int initialTheme;
  const YApp({Key? key, required this.builder, required this.themes, required this.initialTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    theme = YCurrentTheme(currentTheme: initialTheme, themes: themes);
    return Responsive(
      builder: (context) => builder(context),
    );
  }
}
