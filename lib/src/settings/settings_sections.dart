part of settings;

class YSettingsSections extends StatelessWidget {
  final List<YSettingsSection> sections;
  const YSettingsSections({Key? key, required this.sections}) : super(key: key);

  List<Widget> get _sections {
    List<Widget> _els = [];

    for (int i = 0; i < sections.length + sections.length - 1; i++) {
      _els.add(i % 2 == 0 ? sections[i ~/ 2] : const YDivider());
    }

    return _els;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _sections,
    );
  }
}
