part of components;

/// Creates a dropdown button.
class YDropdownButton<T> extends StatelessWidget {
  /// The items.
  final List<YDropdownButtonItem<T>> items;

  /// The dropdown's value.
  final T? value;

  /// The function to call when the value is updated.
  final ValueChanged<T?> onChanged;

  /// The condition to make the button full width.
  ///
  /// Under the hood, we wrap the button with a [Row] and an [Expanded] widgets.
  final bool block;

  /// Creates a dropdown button.
  const YDropdownButton({Key? key, required this.items, this.value, required this.onChanged, this.block = false})
      : super(key: key);

  Widget _content(BuildContext context) => Container(
        decoration: BoxDecoration(color: theme.colors.secondary.backgroundColor, borderRadius: YBorderRadius.lg),
        padding: YPadding.p(YScale.s2),
        child: DropdownButtonHideUnderline(
            child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<T>(
              items: items
                  .map((item) => DropdownMenuItem<T>(
                      value: item.value,
                      child: FittedBox(
                        child: Text(
                          item.display,
                        ),
                      )))
                  .toList(),
              selectedItemBuilder: (BuildContext context) {
                return items.map<Widget>((item) {
                  final Widget text = Text(
                    item.display,
                    style: theme.texts.button.copyWith(color: theme.colors.primary.foregroundColor),
                  );
                  return block
                      ? text
                      : ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: YScale.s32), child: FittedBox(child: text));
                }).toList();
              },
              value: value,
              onChanged: onChanged,
              dropdownColor: theme.colors.backgroundLightColor,
              borderRadius: YBorderRadius.lg,
              icon: Icon(Icons.arrow_drop_down_rounded, color: theme.colors.foregroundLightColor),
              isDense: true,
              style: theme.texts.body1),
        )),
      );

  @override
  Widget build(BuildContext context) {
    return block ? Expanded(child: _content(context)) : _content(context);
  }
}

class YDropdownButtonItem<T> {
  final T value;
  final String display;

  const YDropdownButtonItem({
    required this.value,
    required this.display,
  });
}
