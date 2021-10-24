import 'package:flutter/material.dart';
import 'package:ynotes_packages/components.dart';
import 'package:ynotes_packages/settings.dart';

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
            YSettingsTile(
              title: "Appearance",
              // subtitle: "Light theme",
              leading: Icons.color_lens,
              onTap: () {
                print("tapped");
              },
            ),
            YSettingsTile(
              title: "Location",
              // subtitle: "Light theme",
              leading: Icons.place,
              onTap: () {
                print("tapped");
              },
            ),
            const YDivider(),
            YSettingsTile(
              title: "Appearance",
              subtitle: "Light theme",
              // leading: Icons.color_lens,
              onTap: () {
                print("tapped");
              },
            ),
          ],
        ));
  }
}
