part of components;

/// The different types of input fields
enum YFormFieldInputType { text, password, email, number, phone, url, date, time, dateRange, options }

/// An input field that can be used in a [YForm]. When retrieving the value of the field,
/// the value is returned as a string and must be parsed to the correct type.
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
  final ValueChanged<String?>? onSaved;

  /// When using [YFormFieldInputType.date] or [YFormFieldInputType.dateRange],
  /// this is the initial date set when the modal shows up. Defaults to `DateTime.now()`.
  final DateTime? initialDate;

  /// When using [YFormFieldInputType.date] or [YFormFieldInputType.dateRange],
  /// this is the first date (that mins the minimum date) set when the modal shows up.
  /// Defaults to `DateTime(initialDate.year - 5)`
  final DateTime? firstDate;

  /// When using [YFormFieldInputType.date] or [YFormFieldInputType.dateRange],
  /// this is the first date (that mins the maximum date) set when the modal shows up.
  /// Defaults to `DateTime(initialDate.year + 5)`
  final DateTime? lastDate;

  /// When using [YFormFieldInputType.time], this is the initial time set when the modal shows up.
  /// Defaults to `TimeOfDay.now()`
  final TimeOfDay? initialTime;

  /// When using [YFormFieldInputType.dateRange], this is the initial range
  /// (in fact [initialDate] + [initialDateRangeDuration]) set when the modal shows up.
  /// Defaults to `const Duration(hours: 24 * 3)`
  final Duration? initialDateRangeDuration;

  /// When using [YFormFieldInputType.options], those are the options of the input. In that case,
  /// it musn't be null nor empty.
  final List<YConfirmationDialogOption<int>>? options;

  /// The index of the initial option of the input.
  final int? optionsInitialValue;

  /// An input field that can be used in a [YForm]. When retrieving the value of the field,
  /// the value is returned as a string and must be parsed to the correct type.
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
      required this.onSaved,
      this.initialDate,
      this.firstDate,
      this.lastDate,
      this.initialTime,
      this.initialDateRangeDuration,
      this.options,
      this.optionsInitialValue})
      : assert(type == YFormFieldInputType.options ? (options ?? const []).length != 0 : true,
            "When using the options type, you must provide at least 1 option"),
        super(key: key);

  set focusNode(FocusNode? f) => focusNode = f;
  set textInputAction(TextInputAction? t) => textInputAction = t;

  @override
  _YFormFieldState createState() => _YFormFieldState();
}

class _YFormFieldState extends State<YFormField> {
  late FocusNode focusNode = widget.properties.focusNode ?? FocusNode();
  bool obscured = true;
  bool error = false;
  String? get defaultValue => widget.optionsInitialValue == null && widget.type != YFormFieldInputType.options
      ? widget.defaultValue
      : "${widget.optionsInitialValue}. ${widget.options!.where((option) => option.value == widget.optionsInitialValue).first.label}";
  late TextEditingController controller = TextEditingController(text: defaultValue);

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

  bool modalOpened = false;
  bool blockActionExecution = false;

  bool get isPassword => type == TextInputType.visiblePassword;

  void _customAction() async {
    // Because we unfocus the input, it triggers this function. Using this, we block its execution
    // to avoid infinite modal showing.
    if (blockActionExecution) {
      if (focusNode.hasFocus) {
        focusNode.unfocus();
        return;
      }
      setState(() {
        blockActionExecution = false;
      });
      return;
    }
    // The previous time, the modal was shown to the user so we stop there and block the execution
    // of the action until the input is disabled using the code above.
    if (modalOpened) {
      setState(() {
        modalOpened = false;
        blockActionExecution = true;
      });
      return;
    }
    // Based on the type of the input, a specific modal is shown.

    Future<void> executeAction(Future<String?> callback) async {
      // We show the modal.
      setState(() {
        modalOpened = true;
      });
      final String? res = await callback;
      if (res != null) {
        setState(() {
          controller.value = TextEditingValue(text: res);
        });
      }
    }

    switch (widget.type) {
      case YFormFieldInputType.date:
        final DateTime initialDate = widget.initialDate ?? DateTime.now();
        final Future<String?> callback = _CustomActions.pickDate(context,
            initialDate: controller.value.text != ""
                ? DateTime.parse(controller.value.text.split("/").reversed.join("-"))
                : initialDate,
            firstDate: widget.firstDate ?? DateTime(initialDate.year - 5),
            lastDate: widget.lastDate ?? DateTime(initialDate.year + 5));
        await executeAction(callback);
        break;
      case YFormFieldInputType.time:
        final TimeOfDay initialTime = widget.initialTime ?? TimeOfDay.now();
        final Future<String?> callback = _CustomActions.pickTime(context,
            initialTime: controller.value.text != ""
                ? TimeOfDay(
                    hour: int.parse(controller.value.text.split(":")[0]),
                    minute: int.parse(controller.value.text.split(":")[1].split(" ")[0]))
                : initialTime);
        await executeAction(callback);
        break;
      case YFormFieldInputType.dateRange:
        final DateTime initialDate = widget.initialDate ?? DateTime.now();
        final DateTimeRange initialDateRange = DateTimeRange(
            start: controller.value.text != ""
                ? DateTime.parse(controller.value.text.split(" - ")[0].split("/").reversed.join("-"))
                : initialDate,
            end: controller.value.text != ""
                ? DateTime.parse(controller.value.text.split(" - ")[1].split("/").reversed.join("-"))
                : initialDate.add(widget.initialDateRangeDuration ?? const Duration(hours: 24 * 3)));
        final Future<String?> callback = _CustomActions.pickDateRange(context,
            initialDateRange: initialDateRange,
            firstDate: DateTime(initialDate.year - 5),
            lastDate: DateTime(initialDate.year + 5));
        await executeAction(callback);
        break;
      case YFormFieldInputType.options:
        final int? initialValue = controller.value.text != "" ? int.parse(controller.value.text.split(".")[0]) : null;
        final Future<String?> callback =
            _CustomActions.pickOption(context, options: widget.options!, initialValue: initialValue);
        await executeAction(callback);
        break;
      default:
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
      error = val != null;
    });
    return val;
  }

  Widget? get suffixIcon {
    Widget _wrapper(YIconButton child) => Padding(padding: YPadding.pr(YScale.s3), child: child);
    if (isPassword) {
      return _wrapper(YIconButton(
          icon: obscured ? Icons.visibility : Icons.visibility_off,
          onPressed: () {
            setState(() {
              obscured = !obscured;
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
        autocorrect: widget.autocorrect,
        onChanged: widget.onChanged,
        keyboardType: type,
        textCapitalization: widget.textCapitalization,
        textInputAction: widget.properties.textInputAction,
        focusNode: focusNode,
        maxLength: widget.maxLength,
        maxLines: widget.expandable && !isPassword ? null : 1,
        cursorColor: theme.colors.primary.lightColor,
        obscureText: isPassword ? obscured : false,
        style: theme.texts.body1.copyWith(color: theme.colors.foregroundColor, height: 1.5),
        validator: widget.validator != null ? validate : null,
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
                color: error
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

/// A mutable class with properties used by [YForm].
class YFormFieldProperties {
  FocusNode? focusNode;
  TextInputAction? textInputAction;
  VoidCallback? onEditingComplete;

  YFormFieldProperties({this.focusNode, this.textInputAction, this.onEditingComplete});
}

/// Class that manages the modals to show when the user clicks on the input for some [YFormFieldInputType].
class _CustomActions {
  _CustomActions._();

  static ColorScheme _colorScheme(Brightness brightness) => ColorScheme(
      background: theme.colors.backgroundLightColor, // Useless
      onBackground: theme.colors.foregroundColor, // Useless
      primary: theme.colors.primary.backgroundColor,
      primaryVariant: theme.colors.primary.lightColor,
      onPrimary: theme.colors.primary.foregroundColor,
      secondary: theme.colors.backgroundLightColor, // Useless
      secondaryVariant: theme.colors.backgroundColor, // Useless
      onSecondary: theme.colors.foregroundColor, // Useless
      surface: theme.colors.backgroundLightColor,
      onSurface: theme.colors.foregroundColor,
      error: theme.colors.danger.backgroundColor, // Useless
      onError: theme.colors.danger.foregroundColor, // Useless
      brightness: brightness);

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
        builder: (BuildContext context, Widget? child) => Theme(
            data: ThemeData(
                colorScheme: _colorScheme(Brightness.light),
                dialogBackgroundColor: theme.colors.backgroundLightColor,
                buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                textTheme:
                    TextTheme(subtitle1: theme.texts.body1.copyWith(color: theme.colors.foregroundColor, height: 1.5)),
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: theme.colors.backgroundColor,
                  contentPadding: YPadding.p(YScale.s3),
                  border: UnderlineInputBorder(borderSide: BorderSide.none, borderRadius: YBorderRadius.lg),
                  labelStyle: theme.texts.body1,
                )),
            child: child!));
    if (date != null) return DateFormat("dd/MM/yyyy").format(date);
  }

  static Future<String?> pickTime(BuildContext context, {required TimeOfDay initialTime}) async {
    final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: initialTime,
        builder: (BuildContext context, Widget? child) => Theme(
            data: ThemeData(
              colorScheme: _colorScheme(theme.isDark ? Brightness.dark : Brightness.light),
              buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!));
    if (time != null) return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }

  static Future<String?> pickDateRange(
    BuildContext context, {
    required DateTimeRange initialDateRange,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    final DateTimeRange? date = await showDateRangePicker(
        context: context,
        initialDateRange: initialDateRange,
        firstDate: firstDate,
        lastDate: lastDate,
        builder: (BuildContext context, Widget? child) => Theme(
            data: ThemeData(
              colorScheme: _colorScheme(theme.isDark ? Brightness.dark : Brightness.light),
              dialogBackgroundColor: theme.colors.backgroundLightColor,
              buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
              textTheme:
                  TextTheme(subtitle1: theme.texts.body1.copyWith(color: theme.colors.foregroundColor, height: 1.5)),
            ),
            child: child!));
    if (date != null) {
      return DateFormat("dd/MM/yyyy").format(date.start) + " - " + DateFormat("dd/MM/yyyy").format(date.end);
    }
  }

  static Future<String?> pickOption(BuildContext context,
      {required List<YConfirmationDialogOption<int>> options, int? initialValue}) async {
    final int? res = await YDialogs.getConfirmation<int>(
      context,
      YConfirmationDialog(
        title: "Choisis une option",
        options: options,
        initialValue: initialValue,
      ),
    );
    if (res != null) return "$res. ${options[res].label}";
  }
}
