import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ynotes_packages/theme.dart';

final YTFonts themeFonts = YTFonts(primary: "Asap", secondary: "Asap");

// ignore: non_constant_identifier_names
TextStyle YTextStyle(TextStyle style, {bool primaryfontFamily = false, YTFonts? fonts}) =>
    GoogleFonts.getFont(primaryfontFamily ? (fonts ?? theme.fonts).primary : (fonts ?? theme.fonts).secondary,
        textStyle: style);
