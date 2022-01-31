import 'package:example/main.dart';
import 'package:example/pages/test.dart';
import 'package:flutter/material.dart';
import 'package:ynotes_packages/components.dart';
import 'package:ynotes_packages/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool toggle = false;
  List<YNavigationElement> navEls = [
    YNavigationElement(
      label: "Add",
      icon: Icons.add,
      widget: Center(child: Text("Add", style: TextStyle(color: theme.colors.foregroundColor))),
    ),
    YNavigationElement(
      label: "Minus",
      icon: Icons.minimize,
      widget: Center(child: Text("Minus", style: TextStyle(color: theme.colors.foregroundColor))),
    ),
    YNavigationElement(
      label: "Email",
      icon: Icons.email,
      widget: Center(child: Text("Email", style: TextStyle(color: theme.colors.foregroundColor))),
    ),
    YNavigationElement(
      label: "Favoris",
      icon: Icons.star_rounded,
      widget: Center(child: Text("Favoris", style: TextStyle(color: theme.colors.foregroundColor))),
    ),
  ];

  @override
  void initState() {
    super.initState();
    setSystemUIOverlayStyle();
  }

  @override
  Widget build(BuildContext context) {
    return YPage(
        body: toggle ? null : Center(child: Text('Home', style: TextStyle(color: theme.colors.foregroundColor))),
        onPageChanged: (value) {
          print("new page index: $value");
        },
        onRefresh: () async => await Future.delayed(const Duration(seconds: 2)),
        appBar: Builder(
            builder: (context) => YAppBar(
                  title: "Accueil",
                  actions: [
                    IconButton(
                        splashRadius: 20,
                        splashColor: theme.colors.primary.lightColor,
                        icon: const Icon(Icons.palette),
                        onPressed: () async {
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
                          // setState(() {});
                        }),
                    IconButton(
                        onPressed: () {
                          setSystemUIOverlayStyle();
                        },
                        icon: const Icon(Icons.search_rounded)),
                    IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const TestPage()));
                        },
                        icon: const Icon(Icons.arrow_forward_rounded)),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            toggle = !toggle;
                          });
                        },
                        icon: Icon(toggle ? Icons.check_box : Icons.close)),
                  ],
                )),
        useBottomNavigation: false,
        floatingButtons: [
          YFloatingButton(
              icon: Icons.add,
              onPressed: () {
                setState(() {
                  navEls.add(YNavigationElement(
                    label: "New",
                    icon: Icons.star_rounded,
                    widget: Center(child: Text("New", style: TextStyle(color: theme.colors.foregroundColor))),
                  ));
                });
              }),
          YFloatingButton(
              icon: Icons.remove,
              onPressed: () {
                setState(() {
                  navEls.removeLast();
                });
              }),
        ],
        navigationElements: toggle ? navEls : null,
        drawer: Drawer(
            child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                color: theme.colors.backgroundColor,
                child: ListTileTheme(
                  textColor: theme.colors.foregroundLightColor,
                  child: Column(children: const [
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
