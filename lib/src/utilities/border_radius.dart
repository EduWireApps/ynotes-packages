part of utilities;

class YBorderRadius {
  YBorderRadius._();

  static final BorderRadius none = BorderRadius.zero;
  static final BorderRadius sm = BorderRadius.all(Radius.circular(0.125.rem));
  static final BorderRadius normal = BorderRadius.all(Radius.circular(0.25.rem));
  static final BorderRadius md = BorderRadius.all(Radius.circular(0.375.rem));
  static final BorderRadius lg = BorderRadius.all(Radius.circular(0.5.rem));
  static final BorderRadius xl = BorderRadius.all(Radius.circular(0.75.rem));
  static final BorderRadius xl2 = BorderRadius.all(Radius.circular(1.rem));
  static final BorderRadius xl3 = BorderRadius.all(Radius.circular(1.5.rem));
  static final BorderRadius full = BorderRadius.all(Radius.circular(9999));
}
