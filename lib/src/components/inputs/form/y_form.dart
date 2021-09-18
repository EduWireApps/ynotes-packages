part of components;

/// A form to use with [YFormField]s.
class YForm extends StatefulWidget {
  /// The form key. Must be used to validate the form (using [YFormField] validator)
  /// and retrieve inputs values (using [YFormField] onSaved).
  /// ```dart
  /// _formKey.currentState!.validate();
  /// _formKey.currentState!.save();
  /// ```
  final GlobalKey<FormState> formKey;

  /// The fields of the form.
  final List<YFormField> fields;

  /// On mobile, when the user clicks on _Done_ no its keyboard, the form is submitted
  /// and triggers the onSubmit callback.
  ///
  /// Under the hood, it uses `_formKey.currentState!.validate()`.
  final ValueChanged<bool> onSubmit;

  /// A form to use with [YFormField]s.
  const YForm({Key? key, required this.formKey, required this.fields, required this.onSubmit}) : super(key: key);

  @override
  _YFormState createState() => _YFormState();
}

class _YFormState extends State<YForm> {
  late GlobalKey<FormState> _formKey = widget.formKey;
  late List<FocusNode> _focusNodes;

  List<Widget> get _children {
    List<Widget> _els = [];
    final int _length = widget.fields.length;

    for (var i = 0; i < _length; i++) {
      final YFormField field = widget.fields[i];
      field.properties.focusNode = _focusNodes[i];
      field.properties.textInputAction = i == _length - 1 ? TextInputAction.done : TextInputAction.next;
      field.properties.onEditingComplete = () {
        if (i == _length - 1) {
          field.properties.focusNode!.unfocus();
          final bool _valid = _formKey.currentState!.validate();
          widget.onSubmit(_valid);
        } else {
          widget.fields[i + 1].properties.focusNode!.requestFocus();
        }
      };
    }

    for (var i = 0; i < _length + _length - 1; i++) {
      _els.add(i % 2 == 0 ? widget.fields[i ~/ 2] : YVerticalSpacer(YScale.s3));
    }

    return _els;
  }

  @override
  void initState() {
    super.initState();
    _focusNodes = widget.fields.map((field) => FocusNode()).toList();
  }

  @override
  void dispose() {
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: _children,
        ));
  }
}
