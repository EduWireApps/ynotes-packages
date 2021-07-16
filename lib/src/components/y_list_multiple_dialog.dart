part of components;

class YListMultipleDialog extends StatefulWidget {
  final List<YListMultipleDialogElement> elements;
  final YColor type;
  final YDialogHeader? header;
  final bool fixedHeader;
  final int min;
  final int? max;

  const YListMultipleDialog(
      {Key? key,
      required this.elements,
      this.header,
      this.fixedHeader = true,
      this.type = YColor.primary,
      this.min = 0,
      this.max})
      : super(key: key);

  @override
  _YListMultipleDialogState createState() => _YListMultipleDialogState();
}

class _YListMultipleDialogState extends State<YListMultipleDialog> {
  @override
  void initState() {
    super.initState();
  }

  void _onChanged(bool value) {
    setState(() {});
  }

  String _textValue() {
    String _elements(int i) => "élément${i == 1 ? '' : 's'}";
    final String _beginning = "Tu dois sélectionner";

    if (widget.min == widget.max) {
      return "$_beginning ${widget.min} ${_elements(widget.min)}";
    } else if (widget.min != 0 && widget.max == null) {
      return "$_beginning au minimum ${widget.min} ${_elements(widget.min)}";
    } else if (widget.min == 0 && widget.max != null) {
      return "$_beginning au maximum ${widget.max} ${_elements(widget.max!)}";
    } else {
      return "$_beginning entre ${widget.min} et ${widget.max} ${_elements(widget.max!)}";
    }
  }

  @override
  Widget build(BuildContext context) {
    final int _max = widget.max ?? widget.elements.length;
    final List<YListMultipleDialogElement> selectedElements = widget.elements.where((e) => e.value == true).toList();

    return YDialogBase(
      topFixed: widget.fixedHeader ? widget.header : null,
      children: [
        if (!widget.fixedHeader && widget.header != null) widget.header!,
        ListView.separated(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: widget.elements.length,
            separatorBuilder: (context, index) => YListDialogTileDivider(),
            itemBuilder: (context, index) => YListMultipleTile(
                  element: widget.elements[index],
                  type: widget.type,
                  onChanged: _onChanged,
                ))
      ],
      bottomFixed: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: YButton(
                    onPressed: () => Navigator.pop(context, null),
                    text: "Annuler",
                    type: YColor.neutral,
                    variant: YVariant.reverse),
              ),
              YHorizontalSpacer(6),
              Expanded(
                child: YButton(
                    onPressed: () => Navigator.pop(context, selectedElements),
                    text: "Confirmer",
                    isDisabled: selectedElements.length < widget.min || selectedElements.length > _max,
                    type: widget.type),
              ),
            ],
          ),
          YVerticalSpacer(5),
          if (widget.min != 0 || widget.max != null)
            Text(_textValue(),
                textAlign: TextAlign.center,
                style: TextStyle(color: theme.colors.neutral.shade400, fontSize: YFontSize.base))
        ],
      ),
    );
  }
}

class YListMultipleTile extends StatefulWidget {
  final YListMultipleDialogElement element;
  final YColor type;
  final ValueChanged<bool> onChanged;

  const YListMultipleTile({Key? key, required this.element, required this.type, required this.onChanged})
      : super(key: key);

  @override
  _YListMultipleTileState createState() => _YListMultipleTileState();
}

class _YListMultipleTileState extends State<YListMultipleTile> {
  bool get _value => widget.element.value;
  set _value(bool v) => widget.element.value = v;

  @override
  void initState() {
    super.initState();
  }

  void updateState({bool? value}) {
    setState(() {
      _value = value ?? !_value;
      widget.onChanged(_value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return YListDialogTile(
      onTap: () => updateState(),
      title: widget.element.title,
      description: widget.element.description,
      leading: YCheckbox(
        value: _value,
        onChanged: (bool value) => updateState(value: value),
        type: widget.type,
      ),
    );
  }
}

class YListMultipleDialogElement {
  final dynamic id;
  final String title;
  final String? description;
  bool value;

  YListMultipleDialogElement({required this.id, required this.title, this.description, this.value = false});
}
