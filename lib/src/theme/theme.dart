import 'themes/light/theme.dart';
import 'themes/dark/theme.dart';

import 'colors.dart';
import 'button_styles.dart';

class YTheme {
  final String name;
  final YAvailableTheme theme;
  final bool isDark;
  final YTColors colors;
  final YTButtonStyles buttonStyles;

  YTheme(this.name, {required this.theme, required this.isDark, required this.colors, required this.buttonStyles});
}

class YCurrentTheme {
  YAvailableTheme theme;
  final List<YTheme> themes;

  YCurrentTheme({required this.theme, required this.themes});

  YTheme get _ct => this.themes.firstWhere((t) => t.theme == this.theme);

  String get name => this._ct.name;
  bool get isDark => this._ct.isDark;
  YTColors get colors => this._ct.colors;
  YTButtonStyles get buttonStyles => this._ct.buttonStyles;
}

enum YAvailableTheme { light, dark }
final List<YTheme> themes = [lightTheme, darkTheme];

final YCurrentTheme currentTheme = YCurrentTheme(theme: YAvailableTheme.dark, themes: themes);
