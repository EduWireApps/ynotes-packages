part of components;

class YForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final List<YFormField> fields;
  final ValueChanged<bool> onSubmit;

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
        print("complete");
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
