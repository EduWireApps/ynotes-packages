part of components;

class YListDialog extends StatefulWidget {
  final String title;
  final List<YListDialogItem> items;
  final String cancelLabel;
  final String confirmLabel;
  final bool useSwitches;
  final int minItemsAmount;
  final int? maxItemsAmount;

  const YListDialog(
      {Key? key,
      required this.title,
      required this.items,
      this.cancelLabel = "ANNULER",
      this.confirmLabel = "CONFIRMER",
      this.useSwitches = false,
      this.minItemsAmount = 0,
      this.maxItemsAmount})
      : super(key: key);

  @override
  _YListDialogState createState() => _YListDialogState();
}

class _YListDialogState extends State<YListDialog> {
  late List<YListDialogItem> items = widget.items;
  late int length = this.items.length;
  late int maxItemsAmount = widget.maxItemsAmount ?? this.items.length;

  int get selectedItemsLength => this.items.where((e) => e.value == true).length;

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
    } else if (min == 0 && maxItemsAmount == this.items.length) {
      return null;
    } else {
      return "$_beginning entre $min et $max ${_elements(max)}";
    }
  }

  Widget tile(BuildContext context, {required YListDialogItem item, required ValueChanged<bool> onChanged}) {
    return widget.useSwitches
        ? YSwitchListTile(title: item.label, value: item.value, onChanged: onChanged, end: true)
        : YCheckboxListTile(title: item.label, value: item.value, onChanged: onChanged);
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
              final YListDialogItem item = this.items[index];
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
          variant: YButtonVariant.text,
        ),
        YButton(
          onPressed: () => Navigator.of(context).pop(this.items),
          text: widget.confirmLabel,
          variant: YButtonVariant.contained,
          isDisabled: selectedItemsLength < widget.minItemsAmount || selectedItemsLength > this.maxItemsAmount,
        ),
      ],
    );
  }
}

class YListDialogItem {
  bool value;
  final String label;

  YListDialogItem({required this.value, required this.label});
}
