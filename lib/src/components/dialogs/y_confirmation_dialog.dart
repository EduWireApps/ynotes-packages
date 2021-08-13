part of components;

class YConfirmationDialog<T> extends StatefulWidget {
  final String title;
  final List<YConfirmationDialogItem<T>> items;
  final T? initialValue;
  final String cancelLabel;
  final String confirmLabel;
  final bool mustConfirm;
  final YColor color;

  const YConfirmationDialog(
      {Key? key,
      required this.title,
      required this.items,
      this.initialValue,
      this.cancelLabel = "ANNULER",
      this.confirmLabel = "CONFIRMER",
      this.mustConfirm = true,
      this.color = YColor.primary})
      : super(key: key);

  @override
  _YConfirmationDialogState createState() => _YConfirmationDialogState();
}

class _YConfirmationDialogState<T> extends State<YConfirmationDialog> {
  late T? groupValue = widget.initialValue;
  late int length = widget.items.length;

  Widget mustConfirmBody(BuildContext context) => Column(
        children: List.generate(length, (index) {
          final YConfirmationDialogItem<T> item = widget.items[index] as YConfirmationDialogItem<T>;
          return Column(children: [
            if (index != 0) YDivider(),
            YRadioListTile(
                title: item.label,
                value: item.value,
                groupValue: groupValue,
                color: widget.color,
                onChanged: (dynamic v) {
                  final T value = v;
                  setState(() {
                    groupValue = value;
                  });
                })
          ]);
        }),
      );

  Widget mustntConfirmBody(BuildContext context) => Column(
        children: List.generate(length, (index) {
          final YConfirmationDialogItem<T> item = widget.items[index] as YConfirmationDialogItem<T>;
          final bool selected = widget.initialValue == null ? false : widget.initialValue == item.value;
          final YTColor style = theme.colors.get(widget.color);
          return Column(children: [
            if (index != 0) YDivider(),
            ListTile(
              tileColor: selected ? style.lightColor : null,
              onTap: () => Navigator.of(context).pop(item.value),
              title: Text(
                item.label,
                style: theme.texts.body1.copyWith(color: selected ? style.backgroundColor : null),
              ),
            ),
          ]);
        }),
      );

  @override
  Widget build(BuildContext context) {
    return YDialogBase(
        title: widget.title,
        horizontalPadding: false,
        body: widget.mustConfirm ? mustConfirmBody(context) : mustntConfirmBody(context),
        actions: widget.mustConfirm
            ? [
                YButton(
                    onPressed: () => Navigator.of(context).pop(),
                    text: widget.cancelLabel,
                    variant: YButtonVariant.text,
                    color: widget.color),
                YButton(
                    onPressed: () => Navigator.of(context).pop(groupValue),
                    text: widget.confirmLabel,
                    variant: YButtonVariant.contained,
                    color: widget.color,
                    isDisabled: groupValue == null),
              ]
            : null);
  }
}

class YConfirmationDialogItem<T> {
  final T value;
  final String label;

  const YConfirmationDialogItem({required this.value, required this.label});
}