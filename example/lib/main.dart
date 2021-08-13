import 'package:example/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ynotes_packages/components.dart';
import 'package:ynotes_packages/theme.dart';
import 'package:ynotes_packages/utilities.dart';
import 'package:ynotes_packages/config.dart';

late int? initialThemeId;
late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  initialThemeId = prefs.getInt("themeId");
  if (initialThemeId == null) {
    prefs.setInt("themeId", 0);
    initialThemeId = 0;
  }
  runApp(Phoenix(child: MyApp()));
}

void _setSystemUIOverlayStyle() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, systemNavigationBarColor: theme.colors.backgroundLightColor));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Brightness _brightness;

  void setBrightness(Brightness brightness) {
    setState(() {
      _brightness = brightness;
    });
  }

  @override
  void initState() {
    super.initState();
    final window = WidgetsBinding.instance!.window;
    window.onPlatformBrightnessChanged = () {
      setBrightness(window.platformBrightness);
      Phoenix.rebirth(context);
    };
    setBrightness(window.platformBrightness);
  }

  @override
  Widget build(BuildContext context) => YApp(
      initialTheme: initialThemeId!,
      themes: themes(_brightness),
      builder: (context) {
        _setSystemUIOverlayStyle();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme.themeData,
          home: MyHomePage(title: 'Paramètres'),
        );
      });
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool _status = false;
  List<Widget> _tabs = [
    Tab(
      child: Text("COMPTE"),
    ),
    Tab(
      child: Text("NOTIFICATIONS"),
    ),
    Tab(
      child: Text("DONNÉES"),
    ),
    Tab(
      child: Text("RESUME"),
    ),
    Tab(
      child: Text("TRIMESTRE 3"),
    ),
  ];
  final ScrollController _scrollController = ScrollController();
  late Color _appBarColor = theme.colors.backgroundLightColor;
  late double? _appBarElevation = 0;
  double _drawerWidth = 300;
  late final AnimationController _animationController =
      AnimationController(duration: Duration(milliseconds: 150), vsync: this);
  int _radioListValue = 0;
  double _sliderValue = 20;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _formHasError = false;

  void updateAppBar() {
    final bool _condition = _scrollController.offset > 10;
    setState(() {
      _appBarColor = _condition ? theme.colors.backgroundLightColor : theme.colors.backgroundColor;
      _appBarElevation = _condition ? null : 0;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(updateAppBar);
    WidgetsBinding.instance!.addPostFrameCallback((_) => updateAppBar());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabs.length,
        initialIndex: 0,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: Container(
              width: 100.vw,
              height: 100.vh,
              child: Stack(
                children: [
                  SafeArea(
                    child: Container(
                      padding: YPadding.p(15),
                      width: _drawerWidth,
                      decoration: BoxDecoration(
                          color: theme.colors.backgroundLightColor,
                          border: Border(
                              right: BorderSide(color: theme.colors.foregroundLightColor.withOpacity(.5), width: .5))),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [],
                      ),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
                    builder: (BuildContext context, Widget? child) => Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        left: r<double>(def: 0, lg: _animationController.value * _drawerWidth),
                        child: child!),
                    child: Scaffold(
                        backgroundColor: theme.colors.backgroundColor,
                        drawer: Drawer(
                          child: Container(
                            color: theme.colors.backgroundLightColor,
                          ),
                        ),
                        appBar: AppBar(
                          brightness: theme.isDark ? Brightness.dark : Brightness.light,
                          iconTheme: IconThemeData(color: theme.colors.primary.backgroundColor),
                          centerTitle: false,
                          backgroundColor: _appBarColor,
                          elevation: _appBarElevation,
                          bottom: _tabs.length > 0
                              ? PreferredSize(
                                  preferredSize: Size.fromHeight(kToolbarHeight),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: TabBar(
                                        indicatorColor: theme.colors.primary.backgroundColor,
                                        indicatorWeight: 3.0,
                                        labelColor: theme.colors.primary.backgroundColor,
                                        unselectedLabelColor: theme.colors.foregroundLightColor,
                                        isScrollable: _tabs.length > 2,
                                        labelStyle: theme.texts.button,
                                        tabs: _tabs),
                                  ),
                                )
                              : null,
                          title: Text(widget.title, style: theme.texts.headline),
                          leading: Builder(
                              builder: (context) => IconButton(
                                  splashRadius: 20,
                                  splashColor: theme.colors.primary.lightColor,
                                  icon: Icon(Icons.menu),
                                  onPressed: r<void Function()>(
                                      def: () => Scaffold.of(context).openDrawer(),
                                      lg: () {
                                        setState(() {
                                          switch (_animationController.status) {
                                            case AnimationStatus.completed:
                                              _animationController.reverse();
                                              break;
                                            case AnimationStatus.dismissed:
                                              _animationController.forward();
                                              break;
                                            case AnimationStatus.forward:
                                              _animationController.reverse();
                                              break;
                                            case AnimationStatus.reverse:
                                              _animationController.forward();
                                          }
                                        });
                                      }))),
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
                                          items: theme.themes
                                              .map((e) => YConfirmationDialogItem(value: e.id, label: e.name))
                                              .toList(),
                                          initialValue: theme.currentTheme));
                                  if (res != null) {
                                    updateCurrentTheme(res);
                                    prefs.setInt("themeId", res);
                                  }
                                  updateAppBar();
                                  _setSystemUIOverlayStyle();
                                }),
                            IconButton(
                                splashRadius: 20,
                                splashColor: theme.colors.primary.lightColor,
                                onPressed: () {
                                  debugPrint("Restart app");
                                  Phoenix.rebirth(context);
                                },
                                icon: Icon(Icons.refresh)),
                            YHorizontalSpacer(7.5)
                          ],
                        ),
                        body: SafeArea(
                          child: Column(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  controller: _scrollController,
                                  child: Container(
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        YVerticalSpacer(30),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: YCard(
                                                  margin: YPadding.px(YScale.s4),
                                                  body: Form(
                                                    key: _formKey,
                                                    child: Column(
                                                      children: [
                                                        YSwitchListTile(
                                                            title: "Has error",
                                                            value: _formHasError,
                                                            onChanged: (bool v) {
                                                              setState(() {
                                                                _formHasError = v;
                                                              });
                                                            }),
                                                        YVerticalSpacer(10),
                                                        YFormField(
                                                            type: TextInputType.visiblePassword,
                                                            defaultValue: "TEST",
                                                            expandable: true,
                                                            validator: (String? v) {
                                                              return _formHasError ? "error" : null;
                                                            },
                                                            onChanged: (String v) {
                                                              print(v);
                                                            }),
                                                        YVerticalSpacer(10),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: YButton(
                                                                  onPressed: () {
                                                                    final bool validated =
                                                                        _formKey.currentState!.validate();
                                                                    if (validated)
                                                                      ScaffoldMessenger.of(context)
                                                                          .showSnackBar(SnackBar(
                                                                        content: Text("Validated!",
                                                                            style: theme.texts.body1.copyWith(
                                                                                color: theme
                                                                                    .colors.success.foregroundColor)),
                                                                        backgroundColor:
                                                                            theme.colors.success.backgroundColor,
                                                                        action: SnackBarAction(
                                                                            textColor:
                                                                                theme.colors.success.foregroundColor,
                                                                            label: "Hide",
                                                                            onPressed: () {}),
                                                                      ));
                                                                  },
                                                                  text: "SUBMIT"),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                            ),
                                            Expanded(
                                              flex: r<int>(def: 0, md: 1, lg: 2),
                                              child: Container(),
                                            )
                                          ],
                                        ),
                                        YVerticalSpacer(30),
                                        YCard(
                                          margin: YPadding.p(YScale.s4),
                                          header: YCardHeader(title: Text("Vaccinations", style: theme.texts.title)),
                                          body: Text(
                                              "Lorem ipsum dolor sit amet, consect. In ut sem magna. Donec eget justo felis. Aliquam in ullamcorper libero. ",
                                              style: theme.texts.body1,
                                              textAlign: TextAlign.left),
                                          onTap: () {},
                                          bottomLinks: [
                                            YCardLink(
                                              onTap: () {},
                                            ),
                                            YCardLink(onTap: () {}, icon: Icons.settings),
                                          ],
                                        ),
                                        YVerticalSpacer(30),
                                        YLinksCard(margin: YPadding.p(YScale.s4), links: [
                                          YCardLink(
                                            onTap: () {},
                                          ),
                                          // YCardLink(onTap: () {}, icon: Icons.settings),
                                          YCardLink(onTap: () {}, icon: Icons.settings),
                                        ]),
                                        YVerticalSpacer(30),
                                        YCard(
                                          margin: YPadding.p(YScale.s4),
                                          bottomCta: "Display full screen",
                                          header: YCardHeader(
                                              title: Text("Vaccinations",
                                                  style: theme.texts.title.copyWith(color: Colors.green[400])),
                                              icon: Icons.map,
                                              color: Colors.green[400],
                                              actions: [
                                                IconButton(
                                                    iconSize: theme.texts.title.fontSize!,
                                                    splashRadius: 20,
                                                    padding: EdgeInsets.zero,
                                                    onPressed: () {},
                                                    icon: Icon(Icons.add,
                                                        color: Colors.green[400], size: theme.texts.title.fontSize!)),
                                                IconButton(
                                                    iconSize: theme.texts.title.fontSize!,
                                                    splashRadius: 20,
                                                    padding: EdgeInsets.zero,
                                                    onPressed: () {},
                                                    icon: Icon(Icons.remove,
                                                        color: Colors.green[400], size: theme.texts.title.fontSize!)),
                                                IconButton(
                                                    iconSize: theme.texts.title.fontSize!,
                                                    splashRadius: 20,
                                                    padding: EdgeInsets.zero,
                                                    onPressed: () {},
                                                    icon: Icon(Icons.multiple_stop,
                                                        color: Colors.green[400], size: theme.texts.title.fontSize!)),
                                              ]),
                                          body: Text(
                                              "Lorem ipsum dolor sit amet, consect. In ut sem magna. Donec eget justo felis. Aliquam in ullamcorper libero. ",
                                              style: theme.texts.body1,
                                              textAlign: TextAlign.left),
                                          onTap: () {},
                                        ),
                                        YCard(
                                            margin: YPadding.p(YScale.s4),
                                            body: YSlider(
                                              value: _sliderValue,
                                              max: 100,
                                              min: 0,
                                              onChanged: (double v) {
                                                setState(() {
                                                  _sliderValue = v;
                                                });
                                              },
                                              divisions: 5,
                                              color: YColor.danger,
                                            )),
                                        Padding(
                                          padding: YPadding.px(YScale.s4),
                                          child: Wrap(
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment: WrapCrossAlignment.center,
                                            spacing: 15,
                                            children: [
                                              YButton(
                                                onPressed: () async {
                                                  final bool res = await YDialogs.getChoice(
                                                      context,
                                                      YChoiceDialog(
                                                        color: YColor.success,
                                                        title: "Hep !",
                                                        body: Text("T'es sûr(e) de vouloir faire ça ?",
                                                            style: theme.texts.body1),
                                                      ));
                                                  print(res);
                                                },
                                                text: "CHOICE",
                                              ),
                                              YButton(
                                                onPressed: () async {
                                                  await YDialogs.showInfo(
                                                      context,
                                                      YInfoDialog(
                                                        title: "Hep !",
                                                        body:
                                                            Text("C'est bon, tu es à jour !", style: theme.texts.body1),
                                                        confirmLabel: "COOL !",
                                                      ));
                                                },
                                                text: "INFO",
                                              ),
                                              YButton(
                                                  onPressed: () async {
                                                    final List<YConfirmationDialogItem<int>> items = [0, 1, 2, 3, 4, 5]
                                                        .map((e) =>
                                                            YConfirmationDialogItem<int>(value: e, label: "Option $e"))
                                                        .toList();

                                                    final int? res = await YDialogs.getConfirmation(
                                                        context,
                                                        YConfirmationDialog(
                                                          title: "Select an option",
                                                          items: items,
                                                        ));
                                                    print(res);
                                                  },
                                                  text: "CONFIRMATION"),
                                              YButton(
                                                  onPressed: () async {
                                                    final List<YListDialogItem> items = [0, 1, 2, 3, 4, 5]
                                                        .map((e) =>
                                                            YListDialogItem(value: e % 2 == 0, label: "Option $e"))
                                                        .toList();
                                                    final List<YListDialogItem>? res = await YDialogs.getList(
                                                        context,
                                                        YListDialog(
                                                          title: "Select options",
                                                          items: items,
                                                          minItemsAmount: 1,
                                                          maxItemsAmount: 5,
                                                        ));
                                                    print(res?.map((e) => e.value).toList());
                                                  },
                                                  text: "LIST"),
                                              YSwitch(
                                                value: _status,
                                                onChanged: (bool value) {
                                                  setState(() {
                                                    _status = value;
                                                  });
                                                },
                                                color: YColor.warning,
                                              ),
                                              YRadio<int>(
                                                  color: YColor.success,
                                                  value: 0,
                                                  groupValue: 0,
                                                  onChanged: (dynamic v) {
                                                    final int value = v;
                                                    print(value);
                                                  }),
                                              YCheckbox(
                                                  value: true,
                                                  color: YColor.danger,
                                                  onChanged: (bool value) {
                                                    print(value);
                                                  }),
                                            ],
                                          ),
                                        ),
                                        YCard(
                                            margin: YPadding.p(YScale.s4),
                                            padding: YPadding.py(YScale.s2),
                                            body: Column(
                                              children: [0, 1, 2, 3, 4, 5]
                                                  .map((e) => Column(children: [
                                                        if (e != 0) YDivider(),
                                                        YRadioListTile(
                                                            color: YColor.success,
                                                            title: e.toString(),
                                                            value: e,
                                                            groupValue: _radioListValue,
                                                            end: e == 0 ? true : false,
                                                            onChanged: (dynamic v) {
                                                              final int value = v;
                                                              setState(() {
                                                                _radioListValue = value;
                                                              });
                                                            })
                                                      ]))
                                                  .toList(),
                                            )),
                                        YCard(
                                            margin: YPadding.p(YScale.s4),
                                            padding: YPadding.py(YScale.s2),
                                            body: Column(children: [
                                              YCheckboxListTile(
                                                  title: "Option 1",
                                                  value: _status,
                                                  color: YColor.warning,
                                                  end: true,
                                                  onChanged: (bool v) {
                                                    setState(() {
                                                      _status = v;
                                                    });
                                                  }),
                                              YDivider(),
                                              YCheckboxListTile(
                                                  title: "Option 2",
                                                  value: false,
                                                  color: YColor.warning,
                                                  onChanged: (bool v) {}),
                                              YDivider(),
                                              YCheckboxListTile(
                                                  title: "Option 3",
                                                  value: false,
                                                  color: YColor.warning,
                                                  onChanged: (bool v) {}),
                                            ])),
                                        YCard(
                                            margin: YPadding.p(YScale.s4),
                                            padding: YPadding.py(YScale.s2),
                                            body: Column(children: [
                                              YSwitchListTile(
                                                  title: "Option 1",
                                                  value: _status,
                                                  color: YColor.danger,
                                                  end: true,
                                                  onChanged: (bool v) {
                                                    setState(() {
                                                      _status = v;
                                                    });
                                                  }),
                                              YDivider(),
                                              YSwitchListTile(
                                                  title: "Option 2",
                                                  value: false,
                                                  color: YColor.danger,
                                                  onChanged: (bool v) {}),
                                              YDivider(),
                                              YSwitchListTile(
                                                  title: "Option 3",
                                                  value: false,
                                                  color: YColor.danger,
                                                  onChanged: (bool v) {}),
                                            ])),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(color: theme.colors.backgroundLightColor, boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, -2),
                                      blurRadius: 6,
                                      spreadRadius: 0,
                                      color: Colors.black.withOpacity(.2))
                                ]),
                                child: Center(
                                    child: Text("Connection status...",
                                        style: TextStyle(color: theme.colors.foregroundLightColor))),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
