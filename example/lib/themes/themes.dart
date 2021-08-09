import 'package:example/themes/dark.dart';
import 'package:example/themes/system.dart';
import 'package:flutter/cupertino.dart';
import 'package:ynotes_packages/theme.dart';
import 'light.dart';

List<YTheme> themes(Brightness brightness) => [systemTheme(brightness), lightTheme, darkTheme];
