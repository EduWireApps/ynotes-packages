import 'package:ynotes_components/src/theme/button_styles.dart';
import 'package:ynotes_components/src/theme/utils.dart';

import 'colors.dart';

final YTButtonStyle _primary = YTButtonStyle(
    plain: YTButtonStyleColors(
        background: colors.primary.shade300,
        text: colors.primary.shade500,
        highlight: YThemeUtils.lighten(colors.primary.shade300)),
    reverse: YTButtonStyleColors(
        background: colors.primary.shade200,
        text: colors.primary.shade500,
        highlight: YThemeUtils.lighten(colors.primary.shade200)));

final YTButtonStyle _success = YTButtonStyle(
    plain: YTButtonStyleColors(
        background: colors.success.shade300,
        text: colors.success.shade500,
        highlight: YThemeUtils.lighten(colors.success.shade300)),
    reverse: YTButtonStyleColors(
        background: colors.success.shade200,
        text: colors.success.shade500,
        highlight: YThemeUtils.lighten(colors.success.shade200)));

final YTButtonStyle _warning = YTButtonStyle(
    plain: YTButtonStyleColors(
        background: colors.warning.shade300,
        text: colors.warning.shade500,
        highlight: YThemeUtils.lighten(colors.warning.shade300)),
    reverse: YTButtonStyleColors(
        background: colors.warning.shade200,
        text: colors.warning.shade500,
        highlight: YThemeUtils.lighten(colors.warning.shade200)));

final YTButtonStyle _danger = YTButtonStyle(
    plain: YTButtonStyleColors(
        background: colors.danger.shade300,
        text: colors.danger.shade500,
        highlight: YThemeUtils.lighten(colors.danger.shade300)),
    reverse: YTButtonStyleColors(
        background: colors.danger.shade200,
        text: colors.danger.shade500,
        highlight: YThemeUtils.lighten(colors.danger.shade200)));

final YTButtonStyle _neutral = YTButtonStyle(
  plain: YTButtonStyleColors(
      background: colors.neutral.shade300,
      text: colors.neutral.shade500,
      highlight: YThemeUtils.lighten(colors.neutral.shade300)),
  reverse: YTButtonStyleColors(
      background: colors.neutral.shade100,
      text: colors.neutral.shade500,
      highlight: YThemeUtils.lighten(colors.neutral.shade100)),
);

final List<YTButtonStyle> styles = [_primary];

final YTButtonStyles buttonStyles = YTButtonStyles(
    primary: _primary, success: _success, warning: _warning, danger: _danger, neutral: _neutral, styles: styles);
