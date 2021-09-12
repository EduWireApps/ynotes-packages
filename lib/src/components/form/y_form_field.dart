part of components;

enum YFormFieldInputType { text, password, email, number, phone, url, datetetime }

class YFormField extends StatefulWidget {
  final TextInputType type;
  final String? defaultValue;
  final ValueChanged<String>? onChanged;
  final bool autocorrect;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final bool expandable;
  final String? Function(String?)? validator;
  final bool disabled;
  final String label;
  final String? placeholder;
  final String? helper;
  final YFormFieldProperties properties;

  const YFormField(
      {Key? key,
      required this.type,
      this.defaultValue,
      required this.onChanged,
      this.autocorrect = false,
      this.textCapitalization = TextCapitalization.sentences,
      this.maxLength,
      this.expandable = false,
      this.validator,
      this.disabled = false,
      required this.label,
      this.placeholder,
      this.helper,
      required this.properties})
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
        // IS IT THE RIGHT EVENT ? or onFieldSubmitted ?
        onEditingComplete: widget.properties.onEditingComplete,
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
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          this.obscured = !this.obscured;
                        });
                      },
                      icon: Icon(
                        this.obscured ? Icons.visibility : Icons.visibility_off,
                        color: theme.colors.foregroundLightColor,
                      ),
                    ),
                  )
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
