import 'dart:ui';

enum YStyleType { primary, secondary, success, warning, danger }
enum YStyleVariant { plain, reverse }

class YUtils {
  YUtils();

  String enumToString(dynamic v) => v.toString().split('.')[1];
}

final Map colors = {
  "primary": {
    50: Color(0xffeceef8),
    100: Color(0xffc7cbea),
    200: Color(0xffa2a8dc),
    300: Color(0xff7d85ce),
    400: Color(0xff5863c0),
    500: Color(0xff3f49a7),
    600: Color(0xff313982),
    700: Color(0xff23295d),
    800: Color(0xff151838),
    900: Color(0xff070813),
  },
  "secondary": {
    50: Color(0xffecf8f6),
    100: Color(0xffc7eae4),
    200: Color(0xffa2dcd2),
    300: Color(0xff7dcebf),
    400: Color(0xff58c0ad),
    500: Color(0xff3fa794),
    600: Color(0xff318273),
    700: Color(0xff235d52),
    800: Color(0xff153831),
    900: Color(0xff071310),
  },
  "success": {
    50: Color(0xffecf8f0),
    100: Color(0xffc7ead1),
    200: Color(0xffa2dcb3),
    300: Color(0xff7dce94),
    400: Color(0xff58c075),
    500: Color(0xff3fa75c),
    600: Color(0xff318247),
    700: Color(0xff235d33),
    800: Color(0xff15381f),
    900: Color(0xff07130a),
  },
  "warning": {
    50: Color(0xfffff9e6),
    100: Color(0xfffeecb4),
    200: Color(0xfffde082),
    300: Color(0xfffcd44f),
    400: Color(0xfffbc71d),
    500: Color(0xffe2ae04),
    600: Color(0xffb08703),
    700: Color(0xff7d6102),
    800: Color(0xff4b3a01),
    900: Color(0xff191300),
  },
  "danger": {
    50: Color(0xfffee7e7),
    100: Color(0xfffbb6b6),
    200: Color(0xfff98585),
    300: Color(0xfff75555),
    400: Color(0xfff42424),
    500: Color(0xffdb0b0b),
    600: Color(0xffaa0808),
    700: Color(0xff7a0606),
    800: Color(0xff490404),
    900: Color(0xff180101),
  }
};
