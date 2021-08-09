import 'package:example/themes/themes.dart';
import 'package:example/themes/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:ynotes_packages/components.dart';
import 'package:ynotes_packages/theme.dart';
import 'package:ynotes_packages/utilities.dart';
import 'package:ynotes_packages/config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialTheme: 0,
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

class _MyHomePageState extends State<MyHomePage> {
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      initialIndex: 0,
      child: Scaffold(
          backgroundColor: theme.colors.backgroundColor,
          drawer: Drawer(
            child: Container(
              color: theme.colors.backgroundColor,
            ),
          ),
          appBar: AppBar(
            brightness: theme.isDark ? Brightness.dark : Brightness.light,
            iconTheme: IconThemeData(color: theme.colors.primary.backgroundColor),
            centerTitle: false,
            backgroundColor: _appBarColor,
            elevation: _appBarElevation,
            bottom: TabBar(
                indicatorColor: theme.colors.primary.backgroundColor,
                indicatorWeight: 3.0,
                labelColor: theme.colors.primary.backgroundColor,
                unselectedLabelColor: theme.colors.foregroundLightColor,
                isScrollable: _tabs.length > 2,
                labelStyle: YTextStyle(TextStyle(fontWeight: FontWeight.w600, letterSpacing: .5)),
                tabs: _tabs),
            title: Text(widget.title,
                style: YTextStyle(
                    TextStyle(
                        fontWeight: FontWeight.w800, color: theme.colors.foregroundColor, fontSize: YFontSize.xl2),
                    primaryfontFamily: true)),
            leading: Builder(
                builder: (context) => IconButton(
                    splashRadius: 20,
                    splashColor: theme.colors.primary.lightColor,
                    icon: Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer())),
            actions: [
              IconButton(
                  splashRadius: 20,
                  splashColor: theme.colors.primary.lightColor,
                  icon: Icon(Icons.palette),
                  onPressed: () async {
                    final int? res = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                              backgroundColor: theme.colors.backgroundColor,
                              title: Text("Choose a theme",
                                  style: YTextStyle(TextStyle(color: theme.colors.foregroundColor),
                                      primaryfontFamily: true)),
                              children: theme.themes
                                  .map((e) => SimpleDialogOption(
                                        child: Text(e.name,
                                            style: YTextStyle(
                                              TextStyle(color: theme.colors.foregroundLightColor),
                                            )),
                                        onPressed: () => Navigator.of(context).pop(e.id),
                                      ))
                                  .toList());
                        });
                    if (res != null) {
                      updateCurrentTheme(res);
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
                        children: [
                          YVerticalSpacer(30),
                          Padding(
                            padding: YPadding.px(YScale.s4),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  YButton(
                                    onPressed: () async {
                                      final bool? res = await showDialog(
                                          barrierDismissible: true,
                                          context: context,
                                          builder: (_) => AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: YBorderRadius.lg,
                                                ),
                                                backgroundColor: theme.colors.backgroundColor,
                                                title: Text("Confirmation",
                                                    style: TextStyle(
                                                        color: theme.colors.foregroundColor,
                                                        fontWeight: FontWeight.w700)),
                                                content: Text(
                                                    "Cette action est irréversible. T'es sûr(e) de vouloir faire ça ?",
                                                    style: TextStyle(color: theme.colors.foregroundLightColor)),
                                                actions: [
                                                  YButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop(false);
                                                    },
                                                    text: "ANNULER",
                                                    variant: YButtonVariant.text,
                                                    // isLoading: true,
                                                  ),
                                                  YButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop(true);
                                                    },
                                                    text: "CONFIRMER",
                                                    variant: YButtonVariant.contained,
                                                    // isLoading: true,
                                                  ),
                                                ],
                                              ));
                                      print(res);
                                    },
                                    text: "SHOW TEST DIALOG",
                                    variant: YButtonVariant.contained,
                                    // isLoading: true,
                                  ),
                                  YHorizontalSpacer(10),
                                  YButton(
                                      onPressed: () {
                                        print(Theme.of(context).splashColor);
                                      },
                                      text: "PRINT THEME DATA")
                                ],
                              ),
                            ),
                          ),
                          YVerticalSpacer(30),
                          Padding(
                            padding: YPadding.px(YScale.s4),
                            child: InkWell(
                              borderRadius: YBorderRadius.lg,
                              onTap: () {
                                print("TAPPED");
                              },
                              child: Ink(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: theme.colors.backgroundLightColor,
                                    borderRadius: YBorderRadius.lg,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 2),
                                          blurRadius: 6,
                                          spreadRadius: 0,
                                          color: Colors.black.withOpacity(.2))
                                    ]),
                                child: ClipRRect(
                                  borderRadius: YBorderRadius.lg,
                                  child: Column(
                                    children: [
                                      Container(height: 150),
                                      Container(
                                        height: 56,
                                        color: theme.colors.primary.lightColor,
                                        child: Center(
                                          child: Text("Display full screen",
                                              style: TextStyle(
                                                  color: theme.colors.primary.backgroundColor,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: .5)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          YVerticalSpacer(30),
                          Padding(
                            padding: YPadding.px(YScale.s4),
                            child: InkWell(
                              borderRadius: YBorderRadius.lg,
                              // onTap: () {},
                              child: Ink(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: theme.colors.backgroundLightColor,
                                    borderRadius: YBorderRadius.lg,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 2),
                                          blurRadius: 6,
                                          spreadRadius: 0,
                                          color: Colors.black.withOpacity(.2))
                                    ]),
                                child: ClipRRect(
                                  borderRadius: YBorderRadius.lg,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 30,
                                      ),
                                      Text("France",
                                          style: YTextStyle(TextStyle(color: theme.colors.foregroundLightColor))),
                                      Container(
                                        height: 30,
                                      ),
                                      Divider(
                                        height: 0,
                                        thickness: 0.2,
                                        color: theme.colors.foregroundLightColor,
                                      ),
                                      InkWell(
                                        onTap: () => print("link tapped"),
                                        child: Ink(
                                          padding: YPadding.p(YScale.s4),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.settings, color: theme.colors.primary.backgroundColor),
                                              YHorizontalSpacer(YScale.s4),
                                              Text("Useful links",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      color: theme.colors.primary.backgroundColor)),
                                              YHorizontalSpacer(YScale.s0p5),
                                              Icon(
                                                Icons.arrow_forward,
                                                size: 15,
                                                color: theme.colors.primary.backgroundColor,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 0,
                                        thickness: 0.2,
                                        color: theme.colors.foregroundLightColor,
                                      ),
                                      InkWell(
                                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(YScale.s2)),
                                        onTap: () => print("link tapped"),
                                        child: Ink(
                                          padding: YPadding.p(YScale.s4),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(YScale.s2)),
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.settings, color: theme.colors.primary.backgroundColor),
                                              YHorizontalSpacer(YScale.s4),
                                              Text("Useful links",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      color: theme.colors.primary.backgroundColor)),
                                              YHorizontalSpacer(YScale.s0p5),
                                              Icon(
                                                Icons.arrow_forward,
                                                size: 15,
                                                color: theme.colors.primary.backgroundColor,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          YVerticalSpacer(30),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 15,
                            children: [
                              YButton(
                                onPressed: () async {
                                  final bool res = await YDialogs.getChoice(
                                      context,
                                      YChoiceDialog(
                                        type: YColor.danger,
                                        title: "Hep !",
                                        description: "T'es sûr(e) de vouloir faire ça ?",
                                        icon: Icons.error_outline,
                                      ));
                                  print(res);
                                },
                                text: "Choice",
                              ),
                              YButton(
                                onPressed: () async {
                                  await YDialogs.getConfirmation(
                                      context,
                                      YConfirmationDialog(
                                        type: YColor.primary,
                                        title: "Hep !",
                                        description:
                                            "T'es sûr(e) de vouloir faire ça ? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                        icon: Icons.leaderboard_rounded,
                                      ));
                                },
                                text: "Confirmation",
                              ),
                              YButton(
                                onPressed: () async {
                                  final YListDialogElement? e = await YDialogs.getListChoice(
                                      context,
                                      YListDialog(elements: [
                                        YListDialogElement(
                                            title: "Element 0",
                                            description:
                                                "Awesome description really long yes i know such a shit text but hey i need to test so i keep writing great shit",
                                            icon: Icons.error,
                                            value: 0),
                                        YListDialogElement(
                                            title: "Element 1", description: "Awesome description", value: 1),
                                        YListDialogElement(title: "Element 2", icon: Icons.error, value: 2),
                                        YListDialogElement(title: "Element 3", value: 3),
                                        YListDialogElement(
                                            title: "Element 4",
                                            description:
                                                "Awesome description really long yes i know such a shit text but hey i need to test so i keep writing great shit",
                                            value: 4),
                                        YListDialogElement(
                                            title: "Element 5",
                                            description:
                                                "Awesome description really long yes i know such a shit text but hey i need to test so i keep writing great shit",
                                            value: 5),
                                        YListDialogElement(title: "Element 6", value: 6),
                                        YListDialogElement(
                                            title: "Element 7",
                                            description:
                                                "Awesome description really long yes i know such a shit text but hey i need to test so i keep writing great shit",
                                            value: 7),
                                        YListDialogElement(
                                            title: "Element 8",
                                            description:
                                                "Awesome description really long yes i know such a shit text but hey i need to test so i keep writing great shit",
                                            value: 8),
                                        YListDialogElement(title: "Element 9", value: 9),
                                      ]));
                                  print(e?.value);
                                },
                                text: "List",
                              ),
                              YButton(
                                onPressed: () async {
                                  final List<YListMultipleDialogElement>? res = await YDialogs.getListSelected(
                                      context,
                                      YListMultipleDialog(
                                          header:
                                              YDialogHeader(icon: Icons.error, title: "Title", type: YColor.success),
                                          min: 1,
                                          max: 2,
                                          type: YColor.success,
                                          elements: [
                                            YListMultipleDialogElement(
                                                id: 0,
                                                title: "TEST 1",
                                                description: "awesome description",
                                                value: false),
                                            YListMultipleDialogElement(
                                                id: 1,
                                                title: "TEST 2",
                                                description: "awesome description",
                                                value: true),
                                            YListMultipleDialogElement(
                                                id: 1,
                                                title: "TEST 2",
                                                description: "awesome description",
                                                value: true),
                                            YListMultipleDialogElement(
                                                id: 1,
                                                title: "TEST 2",
                                                description: "awesome description",
                                                value: true),
                                            YListMultipleDialogElement(
                                                id: 1,
                                                title: "TEST 2",
                                                description: "awesome description",
                                                value: true),
                                            YListMultipleDialogElement(
                                                id: 1,
                                                title: "TEST 2",
                                                description: "awesome description",
                                                value: true),
                                            YListMultipleDialogElement(
                                                id: 1,
                                                title: "TEST 2",
                                                description: "awesome description",
                                                value: true),
                                            YListMultipleDialogElement(
                                                id: 1,
                                                title: "TEST 2",
                                                description: "awesome description",
                                                value: true),
                                            YListMultipleDialogElement(
                                                id: 1,
                                                title: "TEST 2",
                                                description: "awesome description",
                                                value: true),
                                            YListMultipleDialogElement(
                                                id: 1,
                                                title: "TEST 2",
                                                description: "awesome description",
                                                value: true),
                                          ]));
                                  print(res);
                                  if (res != null) {
                                    res.forEach((element) {
                                      print(element.id);
                                    });
                                  }
                                },
                                text: "List multiple",
                              ),
                              YSwitch(
                                value: _status,
                                onChanged: (bool value) {
                                  setState(() {
                                    _status = value;
                                  });
                                },
                                type: YColor.success,
                              ),
                            ],
                          ),
                          YVerticalSpacer(50),
                          Padding(
                              padding: YPadding.p(YScale.s4),
                              child: Container(height: 400, color: theme.colors.primary.backgroundColor)),
                          Padding(
                              padding: YPadding.p(YScale.s4),
                              child: Container(height: 400, color: theme.colors.primary.backgroundColor)),
                          Padding(
                              padding: YPadding.p(YScale.s4),
                              child: Container(height: 400, color: theme.colors.primary.backgroundColor)),
                          Padding(
                              padding: YPadding.p(YScale.s4),
                              child: Container(height: 400, color: theme.colors.primary.backgroundColor)),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: theme.colors.backgroundLightColor,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(YScale.s2)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, -2), blurRadius: 6, spreadRadius: 0, color: Colors.black.withOpacity(.2))
                      ]),
                  child: Center(
                      child: Text("Connection status...", style: TextStyle(color: theme.colors.foregroundLightColor))),
                )
              ],
            ),
          )),
    );
  }
}
