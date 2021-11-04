import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:ynotes_packages/components.dart';
import 'package:ynotes_packages/settings.dart';
import 'package:ynotes_packages/theme.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return YPage(
        showScrollbar: true,
        appBar: YAppBar(
          title: "test page",
          actions: [YButton(onPressed: () {}, text: "ENVOYER", variant: YButtonVariant.text)],
          bottom: const YLinearProgressBar(
              // value: 10,
              ),
        ),
        body: Column(
          children: [
            YSettingsSections(sections: [
              YSettingsSection(
                tiles: [
                  YSettingsTile(
                    title: "Appearance",
                    leading: Icons.color_lens,
                    onTap: () {
                      print("tapped");
                    },
                  ),
                  YSettingsTile(
                    title: "Location",
                    leading: Icons.place,
                    onTap: () {
                      print("tapped");
                    },
                  ),
                  YSettingsTile(
                    title: "Notifications",
                    leading: Icons.notifications_rounded,
                    onTap: () {
                      print("tapped");
                    },
                  ),
                  YSettingsTile(
                    title: "Privacy",
                    leading: Icons.lock_rounded,
                    onTap: () {
                      print("tapped");
                    },
                  ),
                ],
              ),
              YSettingsSection(title: "Backups", tiles: [
                YSettingsTile(
                    title: "Thème",
                    subtitle: theme.name,
                    onTap: () async {
                      final int? res = await YDialogs.getConfirmation<int>(
                          context,
                          YConfirmationDialog(
                              title: "Choisis un thème",
                              options: theme.themes
                                  .map((e) => YConfirmationDialogOption(value: e.id, label: e.name))
                                  .toList(),
                              initialValue: theme.currentTheme));
                      if (res != null) {
                        theme.updateCurrentTheme(res);
                        prefs.setInt("themeId", res);
                      }
                      setSystemUIOverlayStyle();
                    }),
                YSettingsTile(
                  enabled: false,
                  disabledOnTap: () {
                    YSnackbars.info(context, title: "ok", message: "message");
                  },
                  title: "Delete account",
                  color: YColor.danger,
                  onTap: () {
                    print("tapped");
                  },
                ),
              ]),
              YSettingsSection(
                tiles: [
                  YSettingsTile(
                    title: "Appearance",
                    leading: Icons.color_lens,
                    onTap: () {
                      print("tapped");
                    },
                  ),
                  YSettingsTile(
                    title: "Location",
                    leading: Icons.place,
                    onTap: () {
                      print("tapped");
                    },
                  ),
                  YSettingsTile(
                    title: "Notifications",
                    leading: Icons.notifications_rounded,
                    onTap: () {
                      print("tapped");
                    },
                  ),
                  YSettingsTile(
                    title: "Privacy",
                    leading: Icons.lock_rounded,
                    onTap: () {
                      print("tapped");
                    },
                  ),
                ],
              ),
              YSettingsSection(
                tiles: [
                  YSettingsTile(
                    title: "Appearance",
                    leading: Icons.color_lens,
                    onTap: () {
                      print("tapped");
                    },
                  ),
                  YSettingsTile(
                    title: "Location",
                    leading: Icons.place,
                    onTap: () {
                      print("tapped");
                    },
                  ),
                  YSettingsTile(
                    title: "Notifications",
                    leading: Icons.notifications_rounded,
                    onTap: () {
                      print("tapped");
                    },
                  ),
                  YSettingsTile(
                    title: "Privacy",
                    leading: Icons.lock_rounded,
                    onTap: () {
                      print("tapped");
                    },
                  ),
                ],
              ),
            ]),
          ],
        ));
  }
}
