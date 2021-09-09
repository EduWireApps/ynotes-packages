part of components;

class YBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final List<BottomNavigationBarItem> items;
  final ValueChanged<int> onTap;

  const YBottomNavigationBar({Key? key, required this.currentIndex, required this.items, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: theme.colors.backgroundLightColor, width: 1.5)),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: theme.colors.backgroundColor,
          currentIndex: currentIndex,
          unselectedItemColor: theme.colors.foregroundLightColor,
          unselectedLabelStyle:
              TextStyle(fontWeight: YFontWeight.medium, fontSize: YFontSize.xs, fontFamily: theme.fonts.primary),
          selectedItemColor: theme.colors.foregroundColor,
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontFamily: theme.fonts.primary, fontSize: YFontSize.base),
          onTap: onTap,
          items: items,
        ));
  }
}
