part of settings;

/// The settings tile type.
enum _SettingsTileType { simple, switchTile }

/// The tile that is used to handle a setting or to redirect to another settings page.
class YSettingsTile extends StatelessWidget {
  /// The title of the tile.
  final String title;

  /// The subtitle of the tile. Usually used to display the setting value
  /// or a description.
  ///
  /// Can't be used with a [leading].
  final String? subtitle;

  /// The icon of the tile. Should only be used for tile used to redirect
  /// to another setting page.
  ///
  /// Can't be used with a [subtitle].
  final IconData? leading;

  /// The action to perform when the tile is tapped.
  final VoidCallback? onTap;

  /// The trailing widget of the tile.
  final Widget? trailing;

  /// The type of the tile. Used only internally.
  final _SettingsTileType _tileType;

  /// The value of the switch tile.
  final bool? switchValue;

  /// The callback to call when the switch value changes.
  final ValueChanged<bool>? onSwitchValueChanged;

  /// The color of the [title]. It should only be used when there is only
  /// a [title].
  final YColor? color;

  /// The tile that is used to handle a setting or to redirect to another settings page.
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

  /// The tile that is used to handle a bool setting.
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
