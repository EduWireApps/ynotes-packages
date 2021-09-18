part of components;

// TODO: implement behavior depending on [YFormFieldInputType]

// The different types of input fields
enum YFormFieldInputType { text, password, email, number, phone, url, datetime, options }

/// An input field that can be used in a [YForm].
class YFormField extends StatefulWidget {
  /// The type of the input field.
  ///
  /// **WARNING:** It's type will change for [YFormFieldInputType] in the future.
  final TextInputType type;

  /// The default of value of the input.
  final String? defaultValue;

  /// The function that will be called when the value of the input changes.
  final ValueChanged<String>? onChanged;

  /// The condition to allow autocorrect.
  final bool autocorrect;

  /// The text capitalization of the input.
  final TextCapitalization textCapitalization;

  /// The max length of the input. It will be shown at its bottom right.
  final int? maxLength;

  /// Condition to make the input expandable, like a `textearea` in web development.
  final bool expandable;

  /// The validator of the input. This function is run when the form containing
  /// this input field is validated.
  ///
  /// The function will receive the value of the input and must return a
  /// [String] (if the value is invalid ans that will be shown as the error)
  /// or [null] (if the value is valid and the error will not be shown).
  ///
  /// If the function is not provided, the field is always considered valid.
  final String? Function(String?)? validator;

  /// The condition to disable the input.
  final bool disabled;

  /// The label of the input.
  final String label;

  /// The placeholder of the input.
  final String? placeholder;

  /// The helper text of the input, used to help the user.
  final String? helper;

  /// The mutable properties of the input. **Will be overriden when used in a [YForm]**.
  /// ```dart
  /// properties: YFormFieldProperties();
  /// ```
  final YFormFieldProperties properties;

  /// The function that will be called when the form is saved. Useful to save all
  /// the values of the inputs of a form.
  final ValueChanged<String?> onSaved;

  /// An input field that can be used in a [YForm].
  const YFormField(
      {Key? key,
      required this.type,
      this.defaultValue,
      this.onChanged,
      this.autocorrect = false,
      this.textCapitalization = TextCapitalization.sentences,
      this.maxLength,
      this.expandable = false,
      this.validator,
      this.disabled = false,
      required this.label,
      this.placeholder,
      this.helper,
      required this.properties,
      required this.onSaved})
      : super(key: key);

  set focusNode(FocusNode? f) => focusNode = f;
  set textInputAction(TextInputAction? t) => textInputAction = t;

  @override
  _YFormFieldState createState() => _YFormFieldState();
}

class _YFormFieldState extends State<YFormField> {
  late FocusNode focusNode = widget.properties.focusNode ?? FocusNode();
  bool obscured = true;
  bool error = false;

  TextInputType get type {
    return widget.type;
  }

  bool get isPassword => this.type == TextInputType.visiblePassword;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {});
    });
  }

  String? validate(String? value) {
    final String? val = widget.validator!(value);
    setState(() {
      this.error = val != null;
    });
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        initialValue: widget.defaultValue,
        autocorrect: widget.autocorrect,
        onChanged: widget.onChanged,
        keyboardType: this.type,
        textCapitalization: widget.textCapitalization,
        textInputAction: widget.properties.textInputAction,
        focusNode: focusNode,
        maxLength: widget.maxLength,
        maxLines: widget.expandable && !this.isPassword ? null : 1,
        cursorColor: theme.colors.primary.lightColor,
        obscureText: this.isPassword ? this.obscured : false,
        style: theme.texts.body1.copyWith(color: theme.colors.foregroundColor, height: 1.5),
        validator: widget.validator != null ? this.validate : null,
        onEditingComplete: widget.properties.onEditingComplete,
        onSaved: widget.onSaved,
        readOnly: widget.disabled,
        decoration: InputDecoration(
            filled: true,
            fillColor: theme.colors.backgroundLightColor,
            contentPadding: YPadding.p(YScale.s3),
            border: UnderlineInputBorder(borderSide: BorderSide.none, borderRadius: YBorderRadius.lg),
            labelText: widget.label,
            labelStyle: theme.texts.body1.copyWith(
                color: this.error
                    ? theme.colors.danger.backgroundColor
                    : focusNode.hasFocus
                        ? theme.colors.primary.backgroundColor
                        : null),
            suffixIcon: this.isPassword
                ? Padding(
                    padding: YPadding.pr(YScale.s3),
                    child: YIconButton(
                        icon: this.obscured ? Icons.visibility : Icons.visibility_off,
                        onPressed: () {
                          setState(() {
                            this.obscured = !this.obscured;
                          });
                        }))
                : null,
            hintText: widget.placeholder,
            hintStyle: theme.texts.body1,
            helperStyle: theme.texts.body2,
            helperText: widget.helper,
            errorStyle: theme.texts.body2.copyWith(color: theme.colors.danger.backgroundColor, fontSize: YFontSize.sm),
            errorMaxLines: 3));
  }
}

class YFormFieldProperties {
  FocusNode? focusNode;
  TextInputAction? textInputAction;
  VoidCallback? onEditingComplete;

  YFormFieldProperties({this.focusNode, this.textInputAction, this.onEditingComplete});
}
