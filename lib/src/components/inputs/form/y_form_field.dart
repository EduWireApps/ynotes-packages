part of components;

// TODO: implement time
// TODO: implement dateRange
// TODO: implement options

/// The different types of input fields
enum YFormFieldInputType { text, password, email, number, phone, url, date, time, dateRange, options }

/// An input field that can be used in a [YForm].
class YFormField extends StatefulWidget {
  /// The type of the input field.
  final YFormFieldInputType type;

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
  final TextEditingController controller = TextEditingController();
  late FocusNode focusNode = widget.properties.focusNode ?? FocusNode();
  bool obscured = true;
  bool error = false;

  TextInputType get type {
    switch (widget.type) {
      case YFormFieldInputType.text:
        return TextInputType.text;
      case YFormFieldInputType.password:
        return TextInputType.visiblePassword;
      case YFormFieldInputType.email:
        return TextInputType.emailAddress;
      case YFormFieldInputType.number:
        return TextInputType.number;
      case YFormFieldInputType.phone:
        return TextInputType.phone;
      case YFormFieldInputType.url:
        return TextInputType.url;
      default:
        return TextInputType.none;
    }
  }

  bool isExecutingCustomAction = false;

  bool get isPassword => this.type == TextInputType.visiblePassword;

  void _customAction() async {
    if (focusNode.hasFocus && isExecutingCustomAction) {
      setState(() {
        isExecutingCustomAction = false;
      });
      focusNode.unfocus();
      return;
    }
    setState(() {
      isExecutingCustomAction = true;
    });
    switch (widget.type) {
      case YFormFieldInputType.date:
        final DateTime now = DateTime.now();
        final String? res = await _CustomActions.pickDate(context,
            initialDate: now, firstDate: DateTime(now.year - 5), lastDate: DateTime(now.year + 5));
        if (res != null) {
          setState(() {
            controller.value = TextEditingValue(text: res);
          });
        }
        break;
      default:
        setState(() {
          isExecutingCustomAction = false;
        });
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {});
      if (type == TextInputType.none) {
        _customAction();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String? validate(String? value) {
    final String? val = widget.validator!(value);
    setState(() {
      this.error = val != null;
    });
    return val;
  }

  Widget? get suffixIcon {
    Widget _wrapper(YIconButton child) => Padding(padding: YPadding.pr(YScale.s3), child: child);
    if (this.isPassword) {
      return _wrapper(YIconButton(
          icon: this.obscured ? Icons.visibility : Icons.visibility_off,
          onPressed: () {
            setState(() {
              this.obscured = !this.obscured;
            });
          }));
    } else if (type == TextInputType.none && controller.value.text != "") {
      return _wrapper(YIconButton(
          icon: Icons.clear_rounded,
          onPressed: () {
            setState(() {
              controller.clear();
            });
          }));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
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
            suffixIcon: suffixIcon,
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

class _CustomActions {
  _CustomActions._();

  static ThemeData get _themeData => ThemeData(
        colorScheme: ColorScheme(
            background: theme.colors.backgroundLightColor, // Useless
            onBackground: theme.colors.foregroundColor, // Useless
            primary: theme.colors.primary.backgroundColor,
            primaryVariant: theme.colors.primary.lightColor,
            onPrimary: theme.colors.primary.foregroundColor,
            secondary: theme.colors.backgroundLightColor, // Useless
            secondaryVariant: theme.colors.backgroundColor, // Useless
            onSecondary: theme.colors.foregroundColor, // Useless
            surface: theme.colors.primary.backgroundColor,
            onSurface: theme.colors.foregroundColor,
            error: theme.colors.danger.backgroundColor, // Useless
            onError: theme.colors.danger.foregroundColor, // Useless
            brightness: Brightness.light),
        dialogBackgroundColor: theme.colors.backgroundLightColor,
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
      );

  static Future<String?> pickDate(
    BuildContext context, {
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
        builder: (BuildContext context, Widget? child) => Theme(data: _themeData, child: child!));
    if (date != null) return DateFormat("dd/MM/yyyy").format(date);
  }

  static Future<String?> pickTime(BuildContext context, {required TimeOfDay initialTime}) async {
    final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: initialTime,
        builder: (BuildContext context, Widget? child) => Theme(data: _themeData, child: child!));
    if (time != null) return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }
}
