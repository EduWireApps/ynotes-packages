import 'package:example/main.dart';
import 'package:example/pages/test.dart';
import 'package:flutter/material.dart';
import 'package:ynotes_packages/components.dart';
import 'package:ynotes_packages/settings.dart';
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
  final Map<String, String> _formData = {};
  bool _switchTileValue = true;
  int? dropDownValue;

  @override
  Widget build(BuildContext context) {
    setSystemUIOverlayStyle();
    return YPage(
        // body: Center(child: Text('Home', style: TextStyle(color: theme.colors.foregroundColor))),
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
                    IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_sharp)),
                  ],
                  bottomHeight: kToolbarHeight,
                )),
        floatingButtons: [
          YFloatingButton(icon: Icons.photo_camera_rounded, onPressed: () {}, color: YColor.secondary),
          YFloatingButton(icon: Icons.edit_rounded, onPressed: () {}),
        ],
        useBottomNavigation: false,
        navigationElements: [
          YNavigationElement(
            label: "Reçus",
            icon: Icons.mail_rounded,
            widget: Column(
              children: [
                YButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const TestPage()));
                    },
                    text: "Open new page",
                    color: YColor.danger),
                YVerticalSpacer(YScale.s4),
                Container(
                    width: 50,
                    height: 50,
                    color: responsive<Color>(
                        def: Colors.red,
                        sm: Colors.orange,
                        md: Colors.yellow,
                        lg: Colors.green,
                        xl: Colors.blue,
                        xxl: Colors.indigo)),
                YVerticalSpacer(YScale.s4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    YDropdownButton<int?>(
                        items: const [
                          YDropdownButtonItem(value: null, display: "Choose"),
                          YDropdownButtonItem(value: 0, display: "1st element"),
                          YDropdownButtonItem(value: 1, display: "2nd element"),
                          YDropdownButtonItem(value: 2, display: "3rd element"),
                          YDropdownButtonItem(value: 3, display: "4th element"),
                          YDropdownButtonItem(value: 4, display: "5th element"),
                          YDropdownButtonItem(value: 5, display: "aa"),
                        ],
                        value: dropDownValue,
                        onChanged: (int? i) {
                          setState(() {
                            dropDownValue = i;
                          });
                        }),
                    YHorizontalSpacer(YScale.s2),
                    YButton(
                        onPressed: () async {
                          final Widget content = Column(
                            children: [
                              ...List.generate(10, (i) => i).map((e) => ListTile(
                                  title: Text("$e", style: theme.texts.body1),
                                  onTap: () {
                                    Navigator.pop(context, e);
                                  })),
                            ],
                          );
                          // final String? res = await YModalBottomSheets.show<String>(context: context, child: content);
                          final int? res = await YModalBottomSheets.show<int>(context: context, child: content);
                          print(res);
                        },
                        text: "Bottom sheet",
                        color: YColor.secondary)
                  ],
                ),
                YVerticalSpacer(YScale.s10),
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
                    YSettingsTile.switchTile(
                      title: "Chat backups",
                      subtitle: "If read receipts are disabled, you won't be able to see read recipients from others.",
                      switchValue: _switchTileValue,
                      onSwitchValueChanged: (bool b) {
                        setState(() {
                          _switchTileValue = b;
                        });
                      },
                    ),
                  ])
                ]),
                YVerticalSpacer(YScale.s12),
                Padding(
                  padding: YPadding.p(YScale.s4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      YButton(
                        text: "SHOW BANNER",
                        onPressed: () {
                          ScaffoldMessenger.of(context).showMaterialBanner(
                            MaterialBanner(
                              content: const Text('Hello, I am a Material Banner'),
                              leading: const Icon(Icons.info),
                              backgroundColor: theme.colors.primary.backgroundColor,
                              actions: [
                                YButton(
                                    onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                                    text: "Hide",
                                    invertColors: true,
                                    variant: YButtonVariant.text)
                              ],
                            ),
                          );
                        },
                        // block: true,
                        variant: YButtonVariant.contained,
                        invertColors: true,
                        color: YColor.secondary,
                        size: YButtonSize.medium,
                        rounded: true,
                      ),
                      const YHorizontalSpacer(20),
                      YIconButton(icon: Icons.edit, onPressed: () {}, tooltip: "Edit")
                    ],
                  ),
                ),
                SizedBox(
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
                          const YVerticalSpacer(10),
                          YFormField(
                            type: YFormFieldInputType.options,
                            expandable: false,
                            validator: (String? v) {
                              return _formHasError ? "Invalid" : null;
                            },
                            onSaved: (String? v) {
                              print(v);
                            },
                            onChanged: (String? v) {
                              print("changed");
                              print(v);
                            },
                            label: "Test input",
                            placeholder: "John",
                            properties: YFormFieldProperties(),
                            initialDate: DateTime(2020, 12, 05),
                            // optionsInitialValue: 1,
                            options: const [
                              YConfirmationDialogOption<int>(value: 0, label: "First element"),
                              YConfirmationDialogOption<int>(value: 1, label: "Second element")
                            ],
                          ),
                          const YVerticalSpacer(10),
                          Row(
                            children: [
                              Expanded(
                                child: YButton(
                                    onPressed: () {
                                      final bool validated = _formKey.currentState!.validate();
                                      if (validated) {
                                        YSnackbars.success(context, message: "Validated", hasIcon: false);
                                      }
                                    },
                                    text: "SE CONNECTER"),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                const YVerticalSpacer(30),
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      YForm(formKey: key, onSubmit: submit, fields: [
                        YFormField(
                          type: YFormFieldInputType.text,
                          autofillHints: const [AutofillHints.username],
                          onChanged: (String value) {},
                          label: "First name",
                          properties: YFormFieldProperties(),
                          validator: (String? v) {
                            return v == null || v == "" ? "This field is required" : null;
                          },
                          onSaved: (String? v) {
                            _formData["firstName"] = v ?? "";
                          },
                        ),
                        YFormField(
                          type: YFormFieldInputType.text,
                          onChanged: (String value) {},
                          label: "Last name (optional)",
                          properties: YFormFieldProperties(),
                          onSaved: (String? v) {
                            _formData["lastName"] = v ?? "";
                          },
                        ),
                        YFormField(
                          type: YFormFieldInputType.password,
                          onChanged: (String value) {},
                          label: "Password",
                          maxLength: 16,
                          autofillHints: const [AutofillHints.password],
                          properties: YFormFieldProperties(),
                          validator: (String? v) {
                            return v == null || v.length < 8 ? "Your password is too short (8 characters min)" : null;
                          },
                          onSaved: (String? v) {
                            _formData["password"] = v ?? "";
                          },
                        ),
                      ]),
                      YButton(
                          onPressed: () {
                            submit(key.currentState!.validate());
                          },
                          text: "Submit test")
                    ],
                  ),
                ),
              ],
            ),
          ),
          YNavigationElement(
            label: "Envoyés",
            icon: Icons.outbox_rounded,
            widget: Center(child: Text("Envoyés", style: TextStyle(color: theme.colors.foregroundColor))),
          ),
          YNavigationElement(
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

  @override
  void initState() {
    super.initState();
    setSystemUIOverlayStyle();
  }

  void submit(bool b) {
    print("form submitted");
    print(b);
    if (b) {
      key.currentState!.save();
      print(_formData);
    }
  }
}
