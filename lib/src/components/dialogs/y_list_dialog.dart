part of components;

/// A dialog to make the user choose one or several options from a list of options.
/// It displays a hint based on [minItemsAmount] and [maxItemsAmount].
class YListDialog extends StatefulWidget {
  /// The title of the dialog.
  final String title;

  /// The options of the dialog.
  final List<YListDialogOption> options;

  /// The text to display for the cancel button. Defaults to _ANNULER_.
  final String cancelLabel;

  /// The text to display for the confirm button. Defaults to _CONFIRMER_.
  final String confirmLabel;

  /// The condition to use [YSwitch]es instead of [YCheckbox]es. Defaults to `false`.
  final bool useSwitches;

  /// The minimum number of options the user has to choose. Defaults to `0`.
  final int minItemsAmount;

  /// The maximum number of options the user can choose.
  final int? maxItemsAmount;

  /// The color of the elements of the dialog. Defaults to [YColor.primary].
  final YColor color;

  /// A dialog to make the user choose one or several options from a list of options.
  /// It displays a hint based on [minItemsAmount] and [maxItemsAmount].
  const YListDialog(
      {Key? key,
      required this.title,
      required this.options,
      this.cancelLabel = "ANNULER",
      this.confirmLabel = "CONFIRMER",
      this.useSwitches = false,
      this.minItemsAmount = 0,
      this.maxItemsAmount,
      this.color = YColor.primary})
      : super(key: key);

  @override
  _YListDialogState createState() => _YListDialogState();
}

class _YListDialogState extends State<YListDialog> {
  late List<YListDialogOption> options = widget.options;
  late int length = this.options.length;
  late int maxItemsAmount = widget.maxItemsAmount ?? this.options.length;

  int get selectedItemsLength => this.options.where((e) => e.value == true).length;

  String? get hint {
    String _elements(int i) => "élément${i == 1 ? '' : 's'}";
    final int min = widget.minItemsAmount;
    final int max = this.maxItemsAmount;
    final String _beginning = "Tu dois sélectionner";

    if (min == max) {
      return "$_beginning $min ${_elements(min)}";
    } else if (min != 0 && widget.maxItemsAmount == null) {
      return "$_beginning au minimum $min ${_elements(min)}";
    } else if (min == 0 && widget.maxItemsAmount != null) {
      return "$_beginning au maximum $max ${_elements(max)}";
    } else if (min == 0 && maxItemsAmount == this.options.length) {
      return null;
    } else {
      return "$_beginning entre $min et $max ${_elements(max)}";
    }
  }

  Widget tile(BuildContext context, {required YListDialogOption item, required ValueChanged<bool> onChanged}) {
    return widget.useSwitches
        ? YSwitchListTile(title: item.label, value: item.value, onChanged: onChanged, color: widget.color)
        : YCheckboxListTile(title: item.label, value: item.value, onChanged: onChanged, color: widget.color);
  }

  @override
  Widget build(BuildContext context) {
    return YDialogBase(
      title: widget.title,
      horizontalPadding: false,
      body: Column(
        children: [
          Column(
            children: List.generate(length, (index) {
              final YListDialogOption item = this.options[index];
              return Column(children: [
                if (index != 0) YDivider(),
                tile(context, item: item, onChanged: (bool v) {
                  setState(() {
                    item.value = v;
                  });
                })
              ]);
            }),
          ),
          if (hint != null)
            Padding(
              padding: EdgeInsets.fromLTRB(YScale.s4, YScale.s4, YScale.s4, 0),
              child: Text(hint!, style: theme.texts.body1),
            )
        ],
      ),
      actions: [
        YButton(
            onPressed: () => Navigator.of(context).pop(),
            text: widget.cancelLabel,
            invertColors: true,
            variant: YButtonVariant.text,
            color: widget.color),
        YButton(
            onPressed: () => Navigator.of(context).pop(this.options),
            text: widget.confirmLabel,
            variant: YButtonVariant.contained,
            isDisabled: selectedItemsLength < widget.minItemsAmount || selectedItemsLength > this.maxItemsAmount,
            color: widget.color),
      ],
    );
  }
}

/// An option for the [YListDialog].
class YListDialogOption {
  /// The value of the option.
  bool value;

  /// The label of the option.
  final String label;

  /// An option for the [YListDialog].
  YListDialogOption({required this.value, required this.label});
}
