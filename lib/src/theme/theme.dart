part of theme;

/// A theme that is used based on the user choice.
///
/// It doesn't have to be only _Light_, _Dark_ or _System_.
/// It is intialized in the [YCurrentTheme] class.
class YTheme {
  /// The identifier of the theme that allows to switch between the themes.
  final int id;

  /// The name of the theme, to display in the user interface. Does not support localization.
  /// If you need it, open a pull request on Github.
  final String name;

  /// The global feeling of the theme. Used for values like [Brightness].
  final bool isDark;

  /// The colors availables for the theme.
  final YTColors colors;

  /// The fonts availables for the theme.
  final YTFonts fonts;

  /// The splash color used with the theme.
  ///
  /// By default, it is equal to [Colors.white12] when [isDark] is true and to [Colors.black12] when [isDark] is false.
  final Color? splashColor;

  /// The texts styles available for the theme. Doesn't follow the Material Design guidelines.
  final YTTexts texts;

  /// A theme that is used based no the user choice.
  ///
  /// It doesn't have to be only _Light_, _Dark_ or _System_.
  /// It is intialized in the [YCurrentTheme] class.
  YTheme(this.name,
      {required this.id,
      required this.isDark,
      required this.colors,
      required this.fonts,
      this.splashColor,
      required this.texts});

  /// The [ThemeData] generated from the theme. It must be used in [MaterialApp] and can be combined.
  ThemeData get themeData => ThemeData(
      colorScheme: ColorScheme(
        primary: colors.backgroundLightColor,
        primaryVariant: colors.backgroundColor,
        onPrimary: colors.foregroundColor,
        secondary: colors.primary.backgroundColor,
        secondaryVariant: colors.primary.lightColor,
        onSecondary: colors.primary.foregroundColor,
        error: colors.danger.backgroundColor,
        onError: colors.danger.foregroundColor,
        background: colors.backgroundColor,
        onBackground: colors.foregroundColor,
        surface: colors.backgroundLightColor,
        onSurface: colors.foregroundLightColor,
        brightness: theme.isDark ? Brightness.dark : Brightness.light,
      ),
      splashColor: splashColor ?? (isDark ? Colors.white12 : Colors.black12),
      highlightColor: Colors.transparent,
      splashFactory: InkRipple.splashFactory,
      fontFamily: fonts.secondary,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: colors.primary.lightColor,
        cursorColor: colors.primary.backgroundColor,
        selectionHandleColor: colors.primary.backgroundColor,
      ));
}

/// A class that manages the themes for the whole app.
class YCurrentTheme extends ChangeNotifier {
  /// The current theme identifier.
  ///
  /// To update the [currentTheme], do:
  /// ```dart
  /// final YCurrentTheme theme = YCurrentTheme(0, [...]);
  /// theme.currentTheme = 1;
  /// ```

  int get currentTheme => _currentTheme;
  int _currentTheme;

  void updateCurrentTheme(int i) {
    _currentTheme = i;
    notifyListeners();
  }

  /// The list of all the themes availables.
  final List<YTheme> themes;

  /// A class that manages the themes for the whole app.
  YCurrentTheme({required int currentTheme, required this.themes}) : _currentTheme = currentTheme;

  /// The current theme to use internally.
  YTheme get _ct => themes.firstWhere((t) => t.id == currentTheme);

  /// The current theme name, to display in the user interface.
  String get name => _ct.name;

  /// The global feeling of the current theme. Used for values like [Brightness].
  bool get isDark => _ct.isDark;

  /// The colors availables for the current theme.
  YTColors get colors => _ct.colors;

  /// The [ThemeData] generated from the current theme. It must be used in [MaterialApp] and can be combined.
  ThemeData get themeData => _ct.themeData;

  /// The fonts availables for the current theme.
  YTFonts get fonts => _ct.fonts;

  /// The texts styles availables for the current theme. Doesn't follow the Material Design guidelines.
  YTTexts get texts => _ct.texts;
}

/// A variable that manage the theme for the whole app.
///
/// To use it, import the package like so:
/// ```dart
/// import 'package:ynotes_packages/theme.dart';
/// ```
late YCurrentTheme theme;
