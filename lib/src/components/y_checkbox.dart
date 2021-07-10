import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/button_styles.dart';
import '../theme/theme.dart';

class YCheckbox extends StatefulWidget {
  final bool value;
  final void Function(bool?) onChanged;
  final YColor type;

  const YCheckbox({Key? key, required this.value, required this.onChanged, this.type = YColor.primary})
      : super(key: key);

  @override
  _YCheckboxState createState() => _YCheckboxState();
}

class _YCheckboxState extends State<YCheckbox> {
  YTButtonStyleColors get style => currentTheme.buttonStyles.get(widget.type).plain;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: currentTheme.colors.neutral.shade100),
      child: Transform.scale(
        scale: 1.2,
        child: Checkbox(
          activeColor: style.background,
          checkColor: style.text,
          value: widget.value,
          onChanged: widget.onChanged,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
