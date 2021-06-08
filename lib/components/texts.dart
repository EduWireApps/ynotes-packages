import 'package:flutter/material.dart';

import 'package:ynotes_components/components/base.dart';
import 'package:ynotes_components/theme/theme.dart';

// ignore: non_constant_identifier_names
YH1(String text, {Color? color, TextStyle? style, TextAlign? align}) =>
    YTextBase(text,
        fontSize: 22,
        color: color ?? currentTheme.neutral[900],
        fontWeight: FontWeight.w700,
        style: style,
        align: align);

// ignore: non_constant_identifier_names
YH2(String text, {Color? color, TextStyle? style, TextAlign? align}) =>
    YTextBase(text,
        fontSize: 18,
        color: color ?? currentTheme.neutral[900],
        fontWeight: FontWeight.w700,
        style: style,
        align: align);

// ignore: non_constant_identifier_names
YH3(String text, {Color? color, TextStyle? style, TextAlign? align}) =>
    YTextBase(text,
        fontSize: 14,
        color: color ?? currentTheme.neutral[900],
        fontWeight: FontWeight.w600,
        style: style,
        align: align);

// ignore: non_constant_identifier_names
YTextBody(String text, {Color? color, TextStyle? style, TextAlign? align}) =>
    YTextBase(text,
        fontSize: 11,
        color: color ?? currentTheme.neutral[700],
        fontWeight: FontWeight.w400,
        style: style,
        align: align);