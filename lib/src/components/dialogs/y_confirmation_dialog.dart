part of components;

// A dialog to make the user choose one option from a list of options.
class YConfirmationDialog<T> extends StatefulWidget {
  /// The title of the dialog.
  final String title;

  /// The options of the dialog.
  final List<YConfirmationDialogOption<T>> options;

  /// The selected option.
  final T? initialValue;

  /// The text to display for the cancel button. Defaults to _ANNULER_.
  final String cancelLabel;

  /// The text to display for the confirm button. Defaults to _CONFIRMER_.
  final String confirmLabel;

  /// The condition to requires the user to confirm. Defaults to `false`.
  final bool mustConfirm;

  /// The color of the elements of the dialog. Defaults to [YColor.primary].
  final YColor color;

  // A dialog to make the user choose one option from a list of options.
  const YConfirmationDialog(
      {Key? key,
      required this.title,
      required this.options,
      this.initialValue,
      this.cancelLabel = "ANNULER",
      this.confirmLabel = "CONFIRMER",
      this.mustConfirm = false,
      this.color = YColor.primary})
      : super(key: key);

  @override
  _YConfirmationDialogState createState() => _YConfirmationDialogState();
}

class _YConfirmationDialogState<T> extends State<YConfirmationDialog> {
  late T? groupValue = widget.initialValue;
  late int length = widget.options.length;

  @override
  Widget build(BuildContext context) {
    return YDialogBase(
        title: widget.title,
        horizontalPadding: false,
        body: Column(
          children: List.generate(length, (index) {
            final YConfirmationDialogOption<T> item = widget.options[index] as YConfirmationDialogOption<T>;
            return Column(children: [
              if (index != 0) const YDivider(),
              YRadioListTile<T?>(
                  title: item.label,
                  value: item.value,
                  groupValue: groupValue,
                  color: widget.color,
                  onChanged: (T? v) {
                    if (!widget.mustConfirm) Navigator.of(context).pop(item.value);
                    setState(() {
                      groupValue = v;
                    });
                  })
            ]);
          }),
        ),
        actions: widget.mustConfirm
            ? [
                YButton(
                    onPressed: () => Navigator.of(context).pop(),
                    text: widget.cancelLabel,
                    variant: YButtonVariant.text,
                    invertColors: true,
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

/// An option for the [YConfirmationDialog].
class YConfirmationDialogOption<T> {
  /// The value of the option.
  final T value;

  /// The label of the option.
  final String label;

  /// An option for the [YConfirmationDialog].
  const YConfirmationDialogOption({required this.value, required this.label});
}
