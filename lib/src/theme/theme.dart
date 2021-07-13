import 'themes/light/theme.dart';
import 'themes/dark/theme.dart';
import 'themes/system/theme.dart';

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

class _Ytheme {
  YAvailableTheme theme;
  final List<YTheme> themes;

  _Ytheme({required this.theme, required this.themes});

  YTheme get _ct => this.themes.firstWhere((t) => t.theme == this.theme);

  String get name => this._ct.name;
  bool get isDark => this._ct.isDark;
  YTColors get colors => this._ct.colors;
  YTButtonStyles get buttonStyles => this._ct.buttonStyles;
}

enum YAvailableTheme { system, light, dark }
final List<YTheme> _themes = [systemTheme, lightTheme, darkTheme];

final _Ytheme theme = _Ytheme(theme: YAvailableTheme.system, themes: _themes);
