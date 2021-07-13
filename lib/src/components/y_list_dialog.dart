part of components;

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
            separatorBuilder: (context, index) => YListDialogTileDivider(),
            itemBuilder: (context, index) {
              bool _hasIcon() {
                for (final YListDialogElement el in widget.elements) {
                  if (el.icon != null) return true;
                }
                return false;
              }

              final YListDialogElement e = widget.elements[index];
              final bool elementHasIcon = _hasIcon();
              final Icon icon = Icon(e.icon, color: theme.colors.neutral.shade400);

              return YListDialogTile(
                onTap: () => Navigator.pop(context, e),
                title: e.title,
                description: e.description,
                leading: elementHasIcon ? icon : (e.icon != null ? icon : null),
              );
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
