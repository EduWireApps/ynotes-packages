part of components;

class YCardLink extends StatelessWidget {
  final BorderRadius? borderRadius;
  final VoidCallback onTap;
  final IconData? icon;

  const YCardLink({Key? key, this.borderRadius, required this.onTap, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = YScale.s4;
    return InkWell(
      borderRadius: this.borderRadius,
      onTap: this.onTap,
      child: Ink(
        padding: YPadding.p(horizontalPadding),
        decoration: BoxDecoration(
          borderRadius: this.borderRadius,
        ),
        child: Container(
          height: YScale.s6,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (this.icon != null) Icon(this.icon, color: theme.colors.primary.backgroundColor),
                  if (this.icon != null) YHorizontalSpacer(horizontalPadding),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Useful links", style: theme.texts.link),
                      YHorizontalSpacer(YScale.s0p5),
                      Icon(
                        Icons.arrow_forward,
                        size: theme.texts.link.fontSize,
                        color: theme.colors.primary.backgroundColor,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
