import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:ynotes_packages/components.dart';
import 'package:ynotes_packages/config.dart';
import 'package:ynotes_packages/theme.dart';
import 'package:ynotes_packages/utilities.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _formHasError = false;
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setSystemUIOverlayStyle();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setSystemUIOverlayStyle();
    return YPage(
        // body: Center(child: Text('Home', style: TextStyle(color: theme.colors.foregroundColor))),
        appBar: YAppBar(
          leading: YAppBarLeading(icon: Icons.menu_rounded),
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
                  setState(() {});
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
          YFloatingButton(icon: Icons.photo_camera_rounded, onPressed: () {}, color: YColor.secondaryLight),
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
                  variant: YButtonVariant.contained,
                  color: YColor.secondaryDark,
                  size: YButtonSize.medium,
                  rounded: true,
                ),
                Container(
                    width: 250,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          YSwitchListTile(
                              color: YColor.success,
                              title: "Has error",
                              value: _formHasError,
                              onChanged: (bool v) {
                                setState(() {
                                  _formHasError = v;
                                });
                              }),
                          YVerticalSpacer(10),
                          YFormField(
                            type: TextInputType.text,
                            expandable: true,
                            validator: (String? v) {
                              return _formHasError ? "Invalid" : null;
                            },
                            onChanged: (String v) {
                              print(v);
                            },
                            label: "First name",
                            placeholder: "John",
                            properties: YFormFieldProperties(),
                          ),
                          YVerticalSpacer(10),
                          Row(
                            children: [
                              Expanded(
                                child: YButton(
                                    onPressed: () {
                                      final bool validated = _formKey.currentState!.validate();
                                      if (validated)
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(borderRadius: YBorderRadius.lg),
                                            content: Text("Validated!",
                                                style: theme.texts.body1
                                                    .copyWith(color: theme.colors.success.foregroundColor)),
                                            backgroundColor: theme.colors.success.backgroundColor,
                                            action: SnackBarAction(
                                                textColor: theme.colors.success.foregroundColor,
                                                label: "Hide",
                                                onPressed: () {}),
                                          ),
                                        );
                                    },
                                    text: "SE CONNECTER"),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                YVerticalSpacer(30),
                Container(
                  width: 300,
                  child: Column(
                    children: [
                      YForm(
                          formKey: key,
                          onSubmit: (bool v) {
                            print(v);
                          },
                          fields: [
                            YFormField(
                              type: TextInputType.text,
                              onChanged: (String value) {},
                              label: "First name",
                              properties: YFormFieldProperties(),
                              validator: (String? v) {
                                return v == null || v == "" ? "This field is required" : null;
                              },
                            ),
                            YFormField(
                              type: TextInputType.text,
                              onChanged: (String value) {},
                              label: "Last name (optional)",
                              properties: YFormFieldProperties(),
                            ),
                            YFormField(
                              type: TextInputType.visiblePassword,
                              onChanged: (String value) {},
                              label: "Password",
                              properties: YFormFieldProperties(),
                              validator: (String? v) {
                                return v == null || v.length < 8
                                    ? "Your password is too short (8 characters min)"
                                    : null;
                              },
                            ),
                          ]),
                      YButton(
                          onPressed: () {
                            key.currentState!.validate();
                          },
                          text: "Submit test")
                    ],
                  ),
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
