part of settings;

/// The section that contains the settings.
class YSettingsSection extends StatelessWidget {
  /// The tiles of the section.
  final List<YSettingsTile> tiles;

  /// The title of the section. Optionnal.
  final String? title;

  /// The section that contains the settings.
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
