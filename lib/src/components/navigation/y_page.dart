part of components;

/// The page component.
class YPage extends StatefulWidget {
  /// The body of the page. If you want to use with [YNavigationElement]s (horizontal slide),
  /// consider using [navigationElements].
  ///
  /// Both [body] and [navigationElements] can't be used nor be null at the same time.
  final Widget? body;

  /// The appBar of the page. Prefer using [YAppBar] (can be in a [Builder] to get the right context)
  /// for [Scaffold].
  final Widget appBar;

  /// The floating buttons of the page. You can't use more than 2. The list can't be empty.
  final List<YFloatingButton>? floatingButtons;

  /// The body of the page for [YNavigationElement]s (horizontal slide). If you want a simple page,
  /// consider using [body].
  ///
  /// Both [body] and [navigationElements] can't be used nor be null at the same time.
  final List<YNavigationElement>? navigationElements;

  /// When using [navigationElements], this is the index of the element that will be shown first.
  final int navigationInitialIndex;

  /// The drawer of the page. It's recommended to use a [Drawer].
  final Widget? drawer;

  /// Is the page scrollable.
  final bool scrollable;

  /// Show a scrolbar. Will be always shown on desktop.
  final bool showScrollbar;

  /// When pulling down, this function will be called.
  final Future<void> Function()? onRefresh;

  /// When using [navigationElements], tabs in the appBar will be shown by default. You can decide to
  /// use a bottom navigation bar instead.
  final bool useBottomNavigation;

  /// When using [navigationElements], this function is called on page change.
  final ValueChanged<int>? onPageChanged;

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
      this.useBottomNavigation = true,
      this.onPageChanged})
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
          if (_controller.index != _index) {
            _index = _controller.index;
            if (widget.onPageChanged != null) {
              widget.onPageChanged!(_index);
            }
          }
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

  Widget pageContainer(BuildContext context, Widget child) {
    final Widget content = SizedBox(
        width: double.infinity,
        height: double.infinity,
        child:
            CustomScrollView(controller: ScrollController(), physics: const AlwaysScrollableScrollPhysics(), slivers: [
          SliverStickyHeader(
              // header: widget.appBar,
              header: appBar(context),
              sliver: SliverToBoxAdapter(child: child)),
        ]));
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

  YAppBar appBar(BuildContext context) {
    late final YAppBar bar;
    if (widget.appBar is Builder) {
      bar = (widget.appBar as Builder).builder(context) as YAppBar;
    } else {
      bar = widget.appBar as YAppBar;
    }
    return YAppBar(
      title: bar.title,
      actions: bar.actions,
      leading: bar.leading,
      bottom: !widget.useBottomNavigation && widget.navigationElements != null
          ? YTabBar(controller: _controller, elements: widget.navigationElements!)
          : bar.bottom,
      removeLeading: bar.removeLeading,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: theme.colors.backgroundColor,
        drawer: widget.drawer,
        body: Builder(
            builder: (context) => widget.navigationElements != null
                ? Column(
                    children: [
                      appBar(context),
                      Expanded(
                        child: TabBarView(
                            controller: _controller,
                            children: widget.navigationElements!
                                .map((e) => ListView(
                                      physics: const ClampingScrollPhysics(),
                                      shrinkWrap: true,
                                      children: [
                                        e.widget,
                                      ],
                                    ))
                                .toList()),
                      ),
                    ],
                  )
                : pageContainer(context, widget.body!)),
        bottomNavigationBar: widget.navigationElements != null && widget.useBottomNavigation
            ? YBottomNavigationBar(
                currentIndex: _index,
                items: widget.navigationElements!,
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
