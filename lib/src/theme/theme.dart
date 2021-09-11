part of theme;

class YTheme {
  final int id;
  final String name;
  final bool isDark;
  final YTColors colors;
  final YTFonts fonts;
  final Color? splashColor;
  final YTTexts texts;

  YTheme(this.name,
      {required this.id,
      required this.isDark,
      required this.colors,
      required this.fonts,
      this.splashColor,
      required this.texts});

  ThemeData get themeData => ThemeData(
      accentColor: this.colors.primary.backgroundColor,
      splashColor: this.splashColor ?? (this.isDark ? Colors.white12 : Colors.black12),
      highlightColor: Colors.transparent,
      splashFactory: InkRipple.splashFactory,
      fontFamily: this.fonts.secondary,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: this.colors.primary.lightColor,
        cursorColor: this.colors.primary.lightColor,
        selectionHandleColor: this.colors.primary.lightColor,
      ));
}

class YCurrentTheme {
  int currentTheme;
  final List<YTheme> themes;

  YCurrentTheme({required this.currentTheme, required this.themes});

  YTheme get _ct => this.themes.firstWhere((t) => t.id == this.currentTheme);

  String get name => this._ct.name;
  bool get isDark => this._ct.isDark;
  YTColors get colors => this._ct.colors;
  ThemeData get themeData => this._ct.themeData;
  YTFonts get fonts => this._ct.fonts;
  YTTexts get texts => this._ct.texts;
}

late YCurrentTheme theme;
