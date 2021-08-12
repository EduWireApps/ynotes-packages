part of components;

class YFormField extends StatefulWidget {
  final TextInputType type;
  final String? defaultValue;
  final ValueChanged<String> onChanged;
  final bool autocorrect;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final bool expandable;
  final String? Function(String?)? validator;

  const YFormField(
      {Key? key,
      required this.type,
      this.defaultValue,
      required this.onChanged,
      this.autocorrect = false,
      this.textCapitalization = TextCapitalization.sentences,
      this.maxLength,
      this.expandable = false,
      this.validator})
      : super(key: key);

  @override
  _YFormFieldState createState() => _YFormFieldState();
}

class _YFormFieldState extends State<YFormField> {
  final FocusNode focusNode = FocusNode();
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
      textInputAction: TextInputAction.next,
      focusNode: focusNode,
      maxLength: widget.maxLength,
      maxLines: widget.expandable && !this.isPassword ? null : 1,
      cursorColor: theme.colors.primary.backgroundColor,
      obscureText: this.isPassword ? this.obscured : false,
      style: theme.texts.body1.copyWith(color: theme.colors.foregroundColor),
      validator: widget.validator != null ? this.validate : null,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderRadius: YBorderRadius.lg,
              borderSide: BorderSide(
                color: theme.colors.foregroundLightColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: YBorderRadius.lg,
              borderSide: BorderSide(color: theme.colors.primary.backgroundColor, width: 2)),
          focusColor: theme.colors.primary.backgroundColor,
          labelText: "First name",
          labelStyle: theme.texts.body1.copyWith(
              color: this.error
                  ? theme.colors.danger.backgroundColor
                  : focusNode.hasFocus
                      ? theme.colors.primary.backgroundColor
                      : null),
          helperStyle: theme.texts.body2,
          errorBorder: OutlineInputBorder(
              borderRadius: YBorderRadius.lg, borderSide: BorderSide(color: theme.colors.danger.backgroundColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: YBorderRadius.lg,
              borderSide: BorderSide(color: theme.colors.danger.backgroundColor, width: 2)),
          errorStyle: theme.texts.body2.copyWith(color: theme.colors.danger.backgroundColor, fontSize: YFontSize.sm),
          errorMaxLines: 3,
          hintText: "John",
          hintStyle: theme.texts.body1,
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
                      color: this.error
                          ? theme.colors.danger.backgroundColor
                          : focusNode.hasFocus
                              ? theme.colors.primary.backgroundColor
                              : theme.colors.foregroundLightColor,
                    ),
                  ),
                )
              : null),
    );
  }
}
