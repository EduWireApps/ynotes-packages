import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:ynotes_packages/components.dart';
import 'package:ynotes_packages/config.dart';
import 'package:ynotes_packages/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    setSystemUIOverlayStyle();
  }

  @override
  Widget build(BuildContext context) {
    setSystemUIOverlayStyle();
    return YPage(
        // body: Center(child: Text('Home', style: TextStyle(color: theme.colors.foregroundColor))),
        appBar: YAppBar(
          leading: YAppBarLeading(icon: Icons.menu_rounded, openDrawer: false),
          actions: [
            IconButton(
                splashRadius: 20,
                splashColor: theme.colors.primary.lightColor,
                icon: Icon(Icons.palette),
                onPressed: () async {
                  final int? res = await YDialogs.getConfirmation<int>(
                      context,
                      YConfirmationDialog(
                          title: "Choisis un thème",
                          mustConfirm: false,
                          items: theme.themes.map((e) => YConfirmationDialogItem(value: e.id, label: e.name)).toList(),
                          initialValue: theme.currentTheme));
                  if (res != null) {
                    updateCurrentTheme(res);
                    prefs.setInt("themeId", res);
                  }
                  setSystemUIOverlayStyle();
                }),
            IconButton(
                onPressed: () {
                  setSystemUIOverlayStyle();
                },
                icon: Icon(Icons.search_rounded)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_sharp)),
          ],
        ),
        floatingButtons: [
          YFloatingButton(icon: Icons.photo_camera_rounded, onPressed: () {}, color: YColor.secondaryDark),
          YFloatingButton(icon: Icons.edit_rounded, onPressed: () {}),
        ],
        bottomNavigationElements: [
          YBottomNavigationElement(
            label: "Reçus",
            icon: Icons.mail_rounded,
            widget: Column(
              children: [
                Center(child: Text("Reçus", style: TextStyle(color: theme.colors.foregroundColor))),
                YButton(
                  text: "CLICK ME!",
                  onPressed: () {},
                  // block: true,
                  size: YButtonSize.medium,
                  rounded: true,
                )
              ],
            ),
          ),
          YBottomNavigationElement(
            label: "Envoyés",
            icon: Icons.outbox_rounded,
            widget: Center(child: Text("Envoyés", style: TextStyle(color: theme.colors.foregroundColor))),
          ),
          YBottomNavigationElement(
            label: "Favoris",
            icon: Icons.star_rounded,
            widget: Center(child: Text("Favoris", style: TextStyle(color: theme.colors.foregroundColor))),
          ),
        ],
        drawer: Drawer(
            child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                color: theme.colors.backgroundColor,
                child: ListTileTheme(
                  textColor: theme.colors.foregroundLightColor,
                  child: Column(children: [
                    ListTile(
                      title: Text("Test"),
                    ),
                    YDivider(),
                    ListTile(title: Text("Test")),
                    ListTile(title: Text("Test")),
                    ListTile(title: Text("Test")),
                    ListTile(title: Text("Test")),
                    ListTile(title: Text("Test")),
                    YDivider(),
                    ListTile(title: Text("Test")),
                    ListTile(title: Text("Test")),
                    ListTile(title: Text("Test")),
                  ]),
                ))));
  }
}
