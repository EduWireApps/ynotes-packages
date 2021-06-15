import 'package:flutter/material.dart';

class YShadowScrollContainer extends StatefulWidget {
  final List<Widget> children;
  final Color color;

  const YShadowScrollContainer({Key? key, required this.children, required this.color}) : super(key: key);

  @override
  _YShadowScrollContainerState createState() => _YShadowScrollContainerState();
}

class _YShadowScrollContainerState extends State<YShadowScrollContainer> {
  final ScrollController _scrollController = ScrollController();
  late bool showTopGradient = false;
  late bool showBottomGradient = true;
  final double distance = 10;
  final double gradientHeight = 56;
  final Duration duration = Duration(milliseconds: 500);
  final Curve curve = Curves.easeInOut;

  @override
  void initState() {
    super.initState();
    _scrollController
      ..addListener(() {
        setState(() {
          showTopGradient = _scrollController.offset > distance;
          showBottomGradient = _scrollController.offset < (_scrollController.position.maxScrollExtent - distance);
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // it is a good practice to dispose the controller
    super.dispose();
  }

  Widget _gradient(BuildContext context, bool isTop) {
    return Container(
      height: gradientHeight,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: isTop ? Alignment.topCenter : Alignment.bottomCenter,
        end: !isTop ? Alignment.topCenter : Alignment.bottomCenter,
        colors: [widget.color, widget.color.withOpacity(0)],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView(
        controller: _scrollController,
        children: widget.children,
      ),
      Positioned(
          top: -1,
          left: 0,
          right: 0,
          child: IgnorePointer(
              ignoring: !showTopGradient,
              child: AnimatedOpacity(
                  curve: curve,
                  opacity: showTopGradient ? 1 : 0,
                  duration: duration,
                  child: _gradient(context, true)))),
      Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: IgnorePointer(
              ignoring: !showBottomGradient,
              child: AnimatedOpacity(
                  curve: curve,
                  opacity: showBottomGradient ? 1 : 0,
                  duration: duration,
                  child: _gradient(context, false)))),
    ]);
  }
}
