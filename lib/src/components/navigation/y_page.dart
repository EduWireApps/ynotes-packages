part of components;

// TODO: document

/// WIP
class YBottomNavigationElement {
  final String label;
  final IconData icon;
  final Widget widget;

  YBottomNavigationElement({required this.label, required this.icon, required this.widget});
}

/// WIP
class YPage extends StatefulWidget {
  final Widget? body;
  final YAppBar appBar;
  final List<YFloatingButton>? floatingButtons;
  final List<YBottomNavigationElement>? bottomNavigationElements;
  final int bottomNavigationInitialIndex;
  final Drawer? drawer;
  final bool scrollable;
  final bool showScrollbar;
  final Future<void> Function()? onRefresh;

  const YPage(
      {Key? key,
      this.body,
      required this.appBar,
      this.floatingButtons,
      this.bottomNavigationElements,
      this.bottomNavigationInitialIndex = 0,
      this.drawer,
      this.scrollable = true,
      this.showScrollbar = false,
      this.onRefresh})
      : assert(floatingButtons == null || floatingButtons.length <= 2, "Can't use more than 2 floating buttons"),
        assert(body == null || bottomNavigationElements == null, "Can't use body and tab views"),
        super(key: key);

  @override
  _YPageState createState() => _YPageState();
}

class _YPageState extends State<YPage> with SingleTickerProviderStateMixin {
  late TabController _controller;
  late int _index = widget.bottomNavigationInitialIndex;

  @override
  void initState() {
    super.initState();
    if (widget.bottomNavigationElements != null) {
      _controller = TabController(initialIndex: _index, length: widget.bottomNavigationElements!.length, vsync: this);
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
    final Widget content = widget.scrollable
        ? widget.showScrollbar
            ? YScrollbar(
                isAlwaysShown: true,
                child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: SingleChildScrollView(physics: const AlwaysScrollableScrollPhysics(), child: child)))
            : SizedBox(width: double.infinity, child: SingleChildScrollView(child: child))
        : child;
    return SafeArea(
        child: widget.onRefresh != null ? YRefreshIndicator(child: content, onRefresh: widget.onRefresh!) : content);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: theme.colors.backgroundColor,
        appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: widget.appBar),
        drawer: widget.drawer,
        body: widget.bottomNavigationElements != null
            ? TabBarView(
                controller: _controller,
                children: widget.bottomNavigationElements!.map((e) => pageContainer(e.widget)).toList())
            : pageContainer(widget.body!),
        bottomNavigationBar: widget.bottomNavigationElements != null
            ? YBottomNavigationBar(
                currentIndex: _index,
                items: widget.bottomNavigationElements!
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
