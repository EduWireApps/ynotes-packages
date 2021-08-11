part of components;

class YLinksCard extends StatefulWidget {
  final List<YCardLink> links;
  final EdgeInsets? margin;

  const YLinksCard({Key? key, required this.links, this.margin}) : super(key: key);

  @override
  _YLinksCardState createState() => _YLinksCardState();
}

class _YLinksCardState extends State<YLinksCard> {
  @override
  Widget build(BuildContext context) {
    final int length = widget.links.length;
    final Radius radius = Radius.circular(YScale.s2);
    BorderRadius? borderRadius(int i) {
      if (i == 0) return BorderRadius.vertical(top: radius);
      if (i == length - 1) return BorderRadius.vertical(bottom: radius);
      return null;
    }

    return YCard(
      margin: widget.margin,
      padding: EdgeInsets.zero,
      body: Column(children: [
        ...List.generate(length, (index) {
          final YCardLink link = widget.links[index];

          return Column(
            children: [
              if (index != 0) YDivider(),
              YCardLink(borderRadius: borderRadius(index), onTap: link.onTap, icon: link.icon),
            ],
          );
        })
      ]),
    );
  }
}
