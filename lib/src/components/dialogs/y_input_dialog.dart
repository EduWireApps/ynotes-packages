part of components;

/// A dialog that retrieves a value from the user.
class YInputDialog extends StatefulWidget {
  /// The title of the dialog.
  final String title;

  /// The input. [YFormField.onChanged] and [YFormField.variant] will be overriden.
  final YFormField input;

  /// The text to display for the cancel button. Defaults to _ANNULER_.
  final String cancelLabel;

  /// The text to display for the cancel button. Defaults to _CONFIRMR_.
  final String confirmLabel;

  /// The color of the elements of the dialog. Defaults to [YColor.primary].
  final YColor color;

  /// A dialog that retrieves a value from the user.
  const YInputDialog(
      {Key? key,
      required this.title,
      required this.input,
      this.cancelLabel = "ANNULER",
      this.confirmLabel = "CONFIRMER",
      this.color = YColor.primary})
      : super(key: key);

  @override
  _YInputDialogState createState() => _YInputDialogState();
}

class _YInputDialogState extends State<YInputDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _value = "";

  void submit(bool b) {
    if (b) {
      Navigator.of(context).pop(_value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return YDialogBase(
        title: widget.title,
        body: YForm(
          formKey: _formKey,
          onSubmit: submit,
          fields: [
            YFormField(
                type: widget.input.type,
                defaultValue: widget.input.defaultValue,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
                autocorrect: widget.input.autocorrect,
                textCapitalization: widget.input.textCapitalization,
                maxLength: widget.input.maxLength,
                expandable: widget.input.expandable,
                validator: widget.input.validator,
                disabled: widget.input.disabled,
                label: widget.input.label,
                placeholder: widget.input.placeholder,
                helper: widget.input.helper,
                properties: widget.input.properties,
                onSaved: widget.input.onSaved,
                initialDate: widget.input.initialDate,
                firstDate: widget.input.firstDate,
                lastDate: widget.input.lastDate,
                initialTime: widget.input.initialTime,
                initialDateRangeDuration: widget.input.initialDateRangeDuration,
                options: widget.input.options,
                optionsInitialValue: widget.input.optionsInitialValue,
                variant: YFormFieldVariant.underline)
          ],
        ),
        actions: [
          YButton(
              onPressed: () => Navigator.of(context).pop(),
              text: widget.cancelLabel,
              variant: YButtonVariant.text,
              color: widget.color),
          YButton(
              onPressed: () {
                submit(_formKey.currentState!.validate());
              },
              text: widget.confirmLabel,
              variant: YButtonVariant.contained,
              color: widget.color),
        ]);
  }
}
