part of components;

/// A slider component.
class YSlider extends StatelessWidget {
  /// The slider's value.
  final double value;

  /// Called during a drag when the user is selecting a new value for the slider by dragging.
  ///
  /// The slider passes the new value to the callback but does not actually change state until the parent widget rebuilds the slider with the new value.
  ///
  /// If null, the slider will be displayed as disabled.
  final ValueChanged<double> onChanged;

  /// The slider's minimum value.
  final double min;

  /// The slider's maximum value.
  final double max;

  /// The number of discrete divisions.
  ///
  /// Typically used with [label] to show the current discrete value.
  ///
  /// If null, the slider is continuous.
  final int? divisions;

  /// The slider's label. Defaults to [value].
  final String? label;

  /// The slider's color. Defaults to [YColor.primary].
  final YColor color;

  /// A slider component.
  const YSlider(
      {Key? key,
      required this.value,
      required this.onChanged,
      required this.min,
      required this.max,
      this.divisions,
      this.label,
      this.color = YColor.primary})
      : super(key: key);

  YTColor get _style => theme.colors.get(color);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
          valueIndicatorColor: _style.backgroundColor,
          valueIndicatorTextStyle: theme.texts.body1.copyWith(color: _style.foregroundColor)),
      child: Slider(
          value: value,
          onChanged: onChanged,
          min: min,
          max: max,
          label: label ?? value.round().toString(),
          divisions: divisions,
          inactiveColor: _style.lightColor,
          activeColor: _style.backgroundColor),
    );
  }
}
