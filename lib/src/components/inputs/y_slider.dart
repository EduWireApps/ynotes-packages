part of components;

class YSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final int? divisions;
  final String? label;
  final YColor color;

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

  YTColor get style => theme.colors.get(this.color);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
          valueIndicatorColor: style.backgroundColor,
          valueIndicatorTextStyle: theme.texts.body1.copyWith(color: style.foregroundColor)),
      child: Slider(
          value: this.value,
          onChanged: this.onChanged,
          min: this.min,
          max: this.max,
          label: this.label ?? this.value.round().toString(),
          divisions: this.divisions,
          inactiveColor: style.lightColor,
          activeColor: style.backgroundColor),
    );
  }
}
