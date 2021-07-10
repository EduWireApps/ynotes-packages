import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../components/base.dart';
import '../theme/theme.dart';

class YListDialog extends StatefulWidget {
  final List<YListDialogElement> elements;
  final YDialogHeader? header;
  final bool fixedHeader;

  const YListDialog({Key? key, required this.elements, this.header, this.fixedHeader = true}) : super(key: key);

  @override
  _YListDialogState createState() => _YListDialogState();
}

class _YListDialogState extends State<YListDialog> {
  @override
  Widget build(BuildContext context) {
    return YDialogBase(
      topFixed: widget.fixedHeader ? widget.header : null,
      children: [
        if (!widget.fixedHeader && widget.header != null) widget.header!,
        ListView.separated(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: widget.elements.length,
            separatorBuilder: (context, index) => Divider(
                  height: 0.0,
                  color: currentTheme.colors.neutral.shade100,
                ),
            itemBuilder: (context, index) {
              bool _hasIcon() {
                for (final YListDialogElement el in widget.elements) {
                  if (el.icon != null) return true;
                }
                return false;
              }

              final YListDialogElement e = widget.elements[index];
              final bool elementHasIcon = _hasIcon();
              final Icon icon = Icon(e.icon, color: currentTheme.colors.neutral.shade400);

              return InkWell(
                  splashColor: currentTheme.colors.neutral.shade300,
                  onTap: () => Navigator.pop(context, e),
                  child: ListTile(
                    minVerticalPadding: 5.sp,
                    dense: true,
                    title: Text(e.title,
                        style: TextStyle(
                            color: currentTheme.colors.neutral.shade500, fontWeight: FontWeight.w600, fontSize: 12.sp)),
                    subtitle: e.description == null
                        ? null
                        : Text(e.description!,
                            style: TextStyle(color: currentTheme.colors.neutral.shade400, fontSize: 9.sp)),
                    leading: elementHasIcon ? icon : (e.icon != null ? icon : null),
                  ));
            })
      ],
    );
  }
}

class YListDialogElement {
  final String title;
  final String? description;
  final dynamic value;
  final IconData? icon;

  YListDialogElement({required this.title, this.description, required this.value, this.icon});
}
