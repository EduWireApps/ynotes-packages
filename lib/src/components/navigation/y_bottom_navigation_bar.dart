part of components;

/// A bottom navigation bar.
class YBottomNavigationBar extends StatelessWidget {
  /// The page current index. State should be managed by parent.
  final int currentIndex;

  /// The list of pages.
  final List<YNavigationElement> items;

  /// The event emitted when a page is selected.
  final ValueChanged<int> onTap;

  const YBottomNavigationBar({Key? key, required this.currentIndex, required this.items, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const YDivider(),
        BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: theme.colors.backgroundColor,
          currentIndex: currentIndex,
          // unselectedItemColor: theme.colors.foregroundLightColor,
          unselectedLabelStyle: theme.texts.body2,
          // unselectedLabelStyle:
          // TextStyle(fontWeight: YFontWeight.medium, fontSize: YFontSize.xs, fontFamily: theme.fonts.primary),
          // selectedItemColor: theme.colors.foregroundColor,
          selectedLabelStyle: theme.texts.button.copyWith(),
          // selectedLabelStyle:
          // TextStyle(fontWeight: FontWeight.bold, fontFamily: theme.fonts.primary, fontSize: YFontSize.base),
          onTap: onTap,
          items: items
              .map((e) => BottomNavigationBarItem(
                    icon: Icon(e.icon),
                    label: e.label,
                  ))
              .toList(),
        ),
      ],
    );
  }
}
