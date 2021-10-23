part of settings;

class YSettingsSection extends StatelessWidget {
  final List<YSettingsTile> tiles;
  final String? title;
  const YSettingsSection({Key? key, required this.tiles, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: YPadding.py(YScale.s4),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (title != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: YScale.s6, vertical: YScale.s4),
              child: Text(title!,
                  style: theme.texts.body1.copyWith(fontWeight: YFontWeight.bold, color: theme.colors.foregroundColor)),
            ),
          ...tiles
        ]));
  }
}
