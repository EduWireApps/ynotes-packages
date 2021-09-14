import 'package:flutter/material.dart';
import 'package:ynotes_packages/theme.dart';
import 'light.dart';
import 'dark.dart';
import 'system.dart';

List<YTheme> themes(Brightness brightness) => [systemTheme(brightness), lightTheme, darkTheme];
