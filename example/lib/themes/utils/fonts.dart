import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ynotes_packages/theme.dart';

final YTFonts themeFonts = YTFonts(primary: "Asap", secondary: "Heebo");

// ignore: non_constant_identifier_names
TextStyle YTextStyle(TextStyle style, {bool primaryfontFamily = false}) =>
    GoogleFonts.getFont(primaryfontFamily ? theme.fonts.primary : theme.fonts.secondary, textStyle: style);
