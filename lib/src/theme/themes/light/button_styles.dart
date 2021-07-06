import 'package:ynotes_components/src/theme/button_styles.dart';
import 'package:ynotes_components/src/theme/utils.dart';

import 'colors.dart';

final YTButtonStyle _primary = YTButtonStyle(
    plain: YTButtonStyleColors(
        background: colors.primary.shade300,
        text: colors.primary.shade100,
        highlight: YThemeUtils.lighten(colors.primary.shade300)),
    reverse: YTButtonStyleColors(
        background: YThemeUtils.darken(colors.primary.shade100),
        text: colors.primary.shade300,
        highlight: colors.primary.shade100));

final YTButtonStyle _success = YTButtonStyle(
    plain: YTButtonStyleColors(
        background: colors.success.shade300,
        text: colors.success.shade100,
        highlight: YThemeUtils.lighten(colors.success.shade300)),
    reverse: YTButtonStyleColors(
        background: YThemeUtils.darken(colors.success.shade100),
        text: colors.success.shade300,
        highlight: colors.success.shade100));

final YTButtonStyle _warning = YTButtonStyle(
    plain: YTButtonStyleColors(
        background: colors.warning.shade300,
        text: colors.warning.shade100,
        highlight: YThemeUtils.lighten(colors.warning.shade300)),
    reverse: YTButtonStyleColors(
        background: YThemeUtils.darken(colors.warning.shade100),
        text: colors.warning.shade300,
        highlight: colors.warning.shade100));

final YTButtonStyle _danger = YTButtonStyle(
    plain: YTButtonStyleColors(
        background: colors.danger.shade300,
        text: colors.danger.shade100,
        highlight: YThemeUtils.lighten(colors.danger.shade300)),
    reverse: YTButtonStyleColors(
        background: YThemeUtils.darken(colors.danger.shade100),
        text: colors.danger.shade300,
        highlight: colors.danger.shade100));

final YTButtonStyle _neutral = YTButtonStyle(
    plain: YTButtonStyleColors(
        background: YThemeUtils.lighten(colors.neutral.shade400, .3),
        text: colors.neutral.shade200,
        highlight: YThemeUtils.lighten(colors.neutral.shade400, .4)),
    reverse: YTButtonStyleColors(
        background: YThemeUtils.darken(colors.neutral.shade200),
        text: colors.neutral.shade400,
        highlight: colors.neutral.shade100));

final List<YTButtonStyle> styles = [_primary];

final YTButtonStyles buttonStyles = YTButtonStyles(
    primary: _primary, success: _success, warning: _warning, danger: _danger, neutral: _neutral, styles: styles);
