part of components;

// ignore: non_constant_identifier_names
YH1(String text, {Color? color, TextStyle? style, TextAlign? align}) => YTextBase(text,
    fontSize: 22,
    color: color ?? theme.colors.neutral.shade500,
    fontWeight: FontWeight.w700,
    style: style,
    align: align);

// ignore: non_constant_identifier_names
YH2(String text, {Color? color, TextStyle? style, TextAlign? align}) => YTextBase(text,
    fontSize: 18,
    color: color ?? theme.colors.neutral.shade500,
    fontWeight: FontWeight.w700,
    style: style,
    align: align);

// ignore: non_constant_identifier_names
YH3(String text, {Color? color, TextStyle? style, TextAlign? align}) => YTextBase(text,
    fontSize: 14,
    color: color ?? theme.colors.neutral.shade500,
    fontWeight: FontWeight.w600,
    style: style,
    align: align);

// ignore: non_constant_identifier_names
YTextBody(String text, {Color? color, TextStyle? style, TextAlign? align}) => YTextBase(text,
    fontSize: 11,
    color: color ?? theme.colors.neutral.shade400,
    fontWeight: FontWeight.w400,
    style: style,
    align: align);
