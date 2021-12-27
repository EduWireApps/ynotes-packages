part of components;

// TODO: document

/// WIP
class YNavigationElement {
  final String label;
  final IconData icon;
  final Widget widget;

  YNavigationElement({required this.label, required this.icon, required this.widget});
}

/// WIP
class YPage extends StatefulWidget {
  final Widget? body;
  final Widget appBar;
  final List<YFloatingButton>? floatingButtons;
  final List<YNavigationElement>? navigationElements;
  final int navigationInitialIndex;
  final Widget? drawer;
  final bool scrollable;
  final bool showScrollbar;
  final Future<void> Function()? onRefresh;
  final bool useBottomNavigation;

  const YPage(
      {Key? key,
      this.body,
      required this.appBar,
      this.floatingButtons,
      this.navigationElements,
      this.navigationInitialIndex = 0,
      this.drawer,
      this.scrollable = true,
      this.showScrollbar = false,
      this.onRefresh,
      this.useBottomNavigation = true})
      : assert(floatingButtons == null || floatingButtons.length <= 2, "Can't use more than 2 floating buttons"),
        assert(body == null || navigationElements == null, "Can't use body and tab views"),
        super(key: key);

  @override
  _YPageState createState() => _YPageState();
}

class _YPageState extends State<YPage> with SingleTickerProviderStateMixin {
  late TabController _controller;
  late int _index = widget.navigationInitialIndex;

  @override
  void initState() {
    super.initState();
    if (widget.navigationElements != null) {
      _controller = TabController(initialIndex: _index, length: widget.navigationElements!.length, vsync: this);
      _controller.addListener(() {
        setState(() {
          _index = _controller.index;
        });
      });
    }
  }

  List<Widget> get floatingButtons {
    List<Widget> _els = [];
    final int _length = widget.floatingButtons!.length;

    for (var i = 0; i < _length + _length - 1; i++) {
      _els.add(i % 2 == 0 ? widget.floatingButtons![i ~/ 2] : YVerticalSpacer(YScale.s4));
    }

    return _els;
  }

  Widget pageContainer(Widget child) {
    final Widget content = SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            controller: ScrollController(), physics: const AlwaysScrollableScrollPhysics(), child: child));
    final Widget scrollbarContent = widget.scrollable
        ? widget.showScrollbar
            ? YScrollbar(
                isAlwaysShown: true,
                child: content,
              )
            : content
        : child;
    return SafeArea(
        child: widget.onRefresh != null
            ? YRefreshIndicator(child: scrollbarContent, onRefresh: widget.onRefresh!)
            : scrollbarContent);
  }

  YAppBar get appBar {
    final YAppBar bar = widget.appBar as YAppBar;
    return YAppBar(
      title: bar.title,
      actions: bar.actions,
      leading: bar.leading,
      bottom: !widget.useBottomNavigation && widget.navigationElements != null
          ? YTabBar(controller: _controller, elements: widget.navigationElements!)
          : bar.bottom,
      removeLeading: bar.removeLeading,
      bottomHeight: bar.bottomHeight,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: theme.colors.backgroundColor,
        appBar: PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight + appBar.height), child: appBar),
        drawer: widget.drawer,
        body: widget.navigationElements != null
            ? TabBarView(
                controller: _controller,
                children: widget.navigationElements!.map((e) => pageContainer(e.widget)).toList())
            : pageContainer(widget.body!),
        bottomNavigationBar: widget.navigationElements != null && widget.useBottomNavigation
            ? YBottomNavigationBar(
                currentIndex: _index,
                items: widget.navigationElements!
                    .map((e) => BottomNavigationBarItem(
                          icon: Icon(e.icon),
                          label: e.label,
                        ))
                    .toList(),
                onTap: (int i) {
                  setState(() {
                    _controller.index = i;
                  });
                },
              )
            : null,
        floatingActionButton:
            widget.floatingButtons != null ? Column(mainAxisSize: MainAxisSize.min, children: floatingButtons) : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      ),
    );
  }
}
