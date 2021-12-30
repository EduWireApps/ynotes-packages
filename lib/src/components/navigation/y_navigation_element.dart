part of components;

/// A class that manages the information for a [YPage]'s subpage.
class YNavigationElement {
  /// The label for the subpage, used in the navigation bar or tab bar.
  final String label;

  /// The icon of the subpage.
  final IconData? icon;

  /// The subpage's content;
  final Widget widget;

  YNavigationElement({required this.label, this.icon, required this.widget});
}
