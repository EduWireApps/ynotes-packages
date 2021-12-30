part of components;

/// A tab bar component.
class YTabBar extends StatelessWidget {
  /// The tab controller.
  final TabController controller;

  /// The tabs.
  final List<YNavigationElement> elements;
  const YTabBar({Key? key, required this.controller, required this.elements}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TabBar(
        controller: controller,
        tabs: elements.asMap().entries.map((e) => _buildTab(e.value, e.key)).toList(),
        isScrollable: true,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: YScale.s0p5, color: theme.colors.primary.backgroundColor)),
      ),
    );
  }

  Tab _buildTab(YNavigationElement element, int index) {
    final Color color = (controller.index + controller.offset.round()) == index
        ? theme.colors.primary.backgroundColor
        : theme.colors.foregroundColor;
    return Tab(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (element.icon != null) Icon(element.icon, color: color),
        if (element.icon != null) YHorizontalSpacer(YScale.s3),
        Text(element.label.toUpperCase(), style: theme.texts.button.copyWith(color: color)),
      ],
    ));
  }
}
