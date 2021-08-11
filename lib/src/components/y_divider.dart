part of components;

class YDivider extends StatelessWidget {
  const YDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      thickness: 0.2,
      color: theme.colors.foregroundLightColor,
    );
  }
}
