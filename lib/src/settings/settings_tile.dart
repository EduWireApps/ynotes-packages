part of settings;

enum _SettingsTileType { simple, switchTile }

class YSettingsTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? leading;
  final VoidCallback? onTap;
  final Widget? trailing;
  final _SettingsTileType _tileType;
  final bool? switchValue;
  final ValueChanged<bool>? onSwitchValueChanged;
  final YColor? color;

  const YSettingsTile(
      {Key? key, required this.title, this.subtitle, this.leading, this.onTap, this.trailing, this.color})
      : assert(subtitle == null && leading == null ? true : (subtitle == null || leading == null),
            "Can't have both subtitle and leading"),
        assert(trailing == null && leading == null ? true : (trailing == null || leading == null),
            "Can't have both trailing and leading"),
        _tileType = _SettingsTileType.simple,
        switchValue = null,
        onSwitchValueChanged = null,
        super(key: key);

  const YSettingsTile.switchTile(
      {Key? key, required this.title, this.subtitle, required this.switchValue, required this.onSwitchValueChanged})
      : leading = null,
        onTap = null,
        trailing = null,
        _tileType = _SettingsTileType.switchTile,
        color = null,
        super(key: key);

  Widget simpleTile(BuildContext context) {
    return ListTile(
      leading: leading != null ? Icon(leading, color: theme.colors.foregroundColor) : null,
      title: Text(title,
          style: theme.texts.body1.copyWith(
              color: color != null ? theme.colors.get(color!).backgroundColor : theme.colors.foregroundColor)),
      subtitle: subtitle != null
          ? Padding(
              padding: YPadding.pt(YScale.s0p5),
              child: Text(
                subtitle!,
                style: theme.texts.body2,
              ),
            )
          : null,
      trailing: trailing != null
          ? Padding(
              padding: YPadding.pl(YScale.s3),
              child: trailing,
            )
          : null,
      onTap: onTap,
      horizontalTitleGap: YScale.s3,
      contentPadding: YPadding.px(YScale.s6),
      minVerticalPadding: YScale.s3,
    );
  }

  Widget switchTile(BuildContext context) {
    return ListTile(
      title: Text(title, style: theme.texts.body1.copyWith(color: theme.colors.foregroundColor)),
      subtitle: subtitle != null
          ? Padding(
              padding: YPadding.pt(YScale.s0p5),
              child: Text(
                subtitle!,
                style: theme.texts.body2,
              ),
            )
          : null,
      trailing: Padding(
        padding: YPadding.pl(YScale.s3),
        child: YSwitch(value: switchValue!, onChanged: onSwitchValueChanged!),
      ),
      onTap: () => onSwitchValueChanged!(!switchValue!),
      horizontalTitleGap: YScale.s3,
      contentPadding: YPadding.px(YScale.s6),
      minVerticalPadding: YScale.s3,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (_tileType) {
      case _SettingsTileType.simple:
        return simpleTile(context);
      case _SettingsTileType.switchTile:
        return switchTile(context);
    }
  }
}
