part of components;

// TODO: document
class YLinearProgressBar extends StatelessWidget {
  final double? value;

  const YLinearProgressBar({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: theme.colors.primary.lightColor,
      color: theme.colors.primary.backgroundColor,
      minHeight: 5,
    );
  }
}
