part of settings;

/// The component that handles multiple [YSettingsSection]s.
class YSettingsSections extends StatelessWidget {
  /// The sections to display.
  final List<Widget> sections;

  /// The component that handles multiple [YSettingsSection]s.
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
