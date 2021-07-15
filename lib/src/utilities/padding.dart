part of utilities;

class YPadding {
  YPadding._();

  static EdgeInsets p(double padding) => EdgeInsets.all(padding);
  static EdgeInsets px(double padding) => EdgeInsets.symmetric(horizontal: padding);
  static EdgeInsets py(double padding) => EdgeInsets.symmetric(vertical: padding);
  static EdgeInsets pt(double padding) => EdgeInsets.only(top: padding);
  static EdgeInsets pb(double padding) => EdgeInsets.only(bottom: padding);
  static EdgeInsets pl(double padding) => EdgeInsets.only(left: padding);
  static EdgeInsets pr(double padding) => EdgeInsets.only(right: padding);
}
