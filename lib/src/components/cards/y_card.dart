part of components;

class YCard extends StatelessWidget {
  final YCardHeader? header;
  final List<YCardLink>? bottomLinks;
  final String? bottomCta;
  final VoidCallback? onTap;
  final Widget body;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const YCard(
      {Key? key,
      this.header,
      this.bottomLinks,
      this.bottomCta,
      this.onTap,
      required this.body,
      this.margin,
      this.padding})
      : assert(bottomLinks == null || bottomCta == null, "Both bottomLink and bottomCta can't be used"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.margin ?? EdgeInsets.zero,
      child: InkWell(
        borderRadius: YBorderRadius.lg,
        onTap: this.onTap,
        child: Ink(
          width: double.infinity,
          decoration: BoxDecoration(
              color: theme.colors.backgroundLightColor,
              borderRadius: YBorderRadius.lg,
              boxShadow: [
                BoxShadow(offset: Offset(0, 2), blurRadius: 6, spreadRadius: 0, color: Colors.black.withOpacity(.2))
              ]),
          child: ClipRRect(
            borderRadius: YBorderRadius.lg,
            child: Column(
              children: [
                Padding(
                    padding: this.padding ?? YPadding.p(YScale.s4),
                    child: Column(children: [
                      if (this.header != null) this.header!,
                      Container(width: double.infinity, child: this.body),
                    ])),
                if (this.bottomCta != null)
                  Container(
                    height: YScale.s14,
                    color: theme.colors.primary.lightColor,
                    child: Center(
                      child: Text(this.bottomCta!, style: theme.texts.link),
                    ),
                  ),
                if (this.bottomLinks != null)
                  ...List.generate(this.bottomLinks!.length, (index) {
                    final int length = this.bottomLinks!.length;
                    final YCardLink link = this.bottomLinks![index];
                    return Column(
                      children: [
                        YDivider(),
                        YCardLink(
                            borderRadius:
                                index == length - 1 ? BorderRadius.vertical(bottom: Radius.circular(YScale.s2)) : null,
                            onTap: link.onTap,
                            icon: link.icon),
                      ],
                    );
                  })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
