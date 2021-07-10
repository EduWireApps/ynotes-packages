import 'package:flutter/material.dart';
import 'package:ynotes_components/ynotes_components.dart';
import 'package:flutter_switch/flutter_switch.dart';

class YSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final YColor type;

  const YSwitch({Key? key, required this.value, required this.onChanged, this.type = YColor.primary}) : super(key: key);

  @override
  _YSwitchState createState() => _YSwitchState();
}

class _YSwitchState extends State<YSwitch> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final double width = 60.0;
    final double height = 30.0;

    return Container(
      width: width,
      height: height,
      child: FlutterSwitch(
        value: widget.value,
        onToggle: widget.onChanged,
        width: width,
        height: height,
        padding: 2.0,
        activeColor: currentTheme.colors.get(widget.type).shade300,
        inactiveColor: currentTheme.colors.neutral.shade100,
      ),
    );
  }
  // late bool _value;
  // late Animation _circleAnimation;
  // late AnimationController _animationController;

  // @override
  // void initState() {
  //   super.initState();
  //   _value = widget.value;
  //   _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 60));
  //   _circleAnimation = AlignmentTween(
  //           begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
  //           end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
  //       .animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return AnimatedBuilder(
  //     animation: _animationController,
  //     builder: (context, child) => GestureDetector(
  //         onTap: () {
  //           if (_value != widget.value) {
  //             setState(() {
  //               if (_animationController.isCompleted) {
  //                 _animationController.reverse();
  //               } else {
  //                 _animationController.forward();
  //               }
  //               _value = widget.value;
  //               widget.onChanged(!widget.value);
  //             });
  //           }
  //         },
  //         child: Container(
  //           padding: EdgeInsets.all(2),
  //           width: 60.0,
  //           height: 30.0,
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(20.0),
  //               color: _circleAnimation.value == Alignment.centerLeft
  //                   ? currentTheme.colors.neutral.shade100
  //                   : currentTheme.colors.get(widget.type).shade300),
  //           child: Align(
  //             alignment: _circleAnimation.value,
  //             child: Container(
  //               width: 25.0,
  //               height: 25.0,
  //               decoration: BoxDecoration(shape: BoxShape.circle, color: currentTheme.buttonStyles.neutral.plain.text),
  //             ),
  //           ),
  //         )),
  //   );
  // }
}
