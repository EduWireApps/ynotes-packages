part of components;

class YCardHeader extends StatelessWidget {
  final IconData? icon;
  final Widget title;
  final Color? color;
  final List<IconButton>? actions;

  const YCardHeader({Key? key, this.icon, required this.title, this.color, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (this.icon != null)
                Icon(
                  this.icon,
                  color: this.color ?? theme.colors.foregroundColor,
                  size: theme.texts.title.fontSize,
                ),
              if (this.icon != null) YHorizontalSpacer(YScale.s2),
              this.title,
              Expanded(
                child: Container(),
              ),
              if (this.actions != null) ...this.actions!
            ],
          ),
        ),
        YVerticalSpacer(YScale.s2)
      ],
    );
  }
}
