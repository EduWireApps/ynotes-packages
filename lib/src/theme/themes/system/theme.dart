import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ynotes_components/src/theme/button_styles.dart';
import 'package:ynotes_components/src/theme/colors.dart';
import 'package:ynotes_components/src/theme/theme.dart';

import '../light/colors.dart' as lightColors;
import '../light/button_styles.dart' as lightButtonStyles;
import '../dark/colors.dart' as darkColors;
import '../dark/button_styles.dart' as darkButtonStyles;

var brightness = SchedulerBinding.instance!.window.platformBrightness;
bool darkModeOn = brightness == Brightness.dark;

final YTColors colors = darkModeOn ? darkColors.colors : lightColors.colors;
final YTButtonStyles buttonStyles = darkModeOn ? darkButtonStyles.buttonStyles : lightButtonStyles.buttonStyles;

final YTheme systemTheme =
    YTheme("Système", theme: YAvailableTheme.system, isDark: darkModeOn, colors: colors, buttonStyles: buttonStyles);
