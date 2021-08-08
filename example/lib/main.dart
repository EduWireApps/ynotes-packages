import 'package:example/test_page.dart';
import 'package:example/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:ynotes_packages/components.dart';
import 'package:ynotes_packages/theme.dart';
import 'package:ynotes_packages/utilities.dart';
import 'package:flutter_responsive_breakpoints/flutter_responsive_breakpoints.dart';

void main() {
  theme = YCurrentTheme(currentTheme: 1, themes: themes);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  _setNavigationBarColor();
  runApp(Phoenix(child: MyApp()));
}

void _setNavigationBarColor() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarColor: theme.colors.backgroundLightColor));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Responsive(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme.themeData,
          home: MyHomePage(title: 'Demo'),
        ),
      );
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _status = false;
  bool _isLightMode = true;
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
      length: 2,
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
            iconTheme: IconThemeData(color: theme.colors.foregroundColor),
            centerTitle: false,
            backgroundColor: _appBarColor,
            elevation: _appBarElevation,
            bottom: TabBar(
                indicatorColor: theme.colors.primary.backgroundColor,
                labelColor: theme.colors.primary.backgroundColor,
                unselectedLabelColor: theme.colors.foregroundLightColor,
                tabs: [
                  Tab(
                    child: Text("TAB 1"),
                  ),
                  Tab(
                    child: Text("TAB 2"),
                  ),
                ]),
            title: Text(widget.title,
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: theme.colors.foregroundColor, fontFamily: theme.fonts.primary)),
            actions: [
              IconButton(
                  icon: Icon(_isLightMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
                  onPressed: () {
                    theme.currentTheme = _isLightMode ? 2 : 1;
                    setState(() {
                      _isLightMode = !_isLightMode;
                    });
                    updateAppBar();
                    _setNavigationBarColor();
                  }),
              IconButton(
                  onPressed: () {
                    debugPrint("Restart app");
                    Phoenix.rebirth(context);
                  },
                  icon: Icon(Icons.refresh)),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TestPage())),
              )
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
                          Row(
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
                                                    color: theme.colors.foregroundColor, fontWeight: FontWeight.w700)),
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
                            ],
                          ),
                          YVerticalSpacer(30),
                          Padding(
                            padding: YPadding.px(YScale.s6),
                            child: InkWell(
                              borderRadius: YBorderRadius.lg,
                              highlightColor: Colors.transparent,
                              splashColor: theme.isDark ? Colors.white12 : Colors.black12,
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
                            padding: YPadding.px(YScale.s6),
                            child: InkWell(
                              borderRadius: YBorderRadius.lg,
                              highlightColor: Colors.transparent,
                              splashColor: theme.isDark ? Colors.white12 : Colors.black12,
                              onTap: null,
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
                                      InkWell(
                                        onTap: () => print("link tapped"),
                                        child: ListTileTheme(
                                          iconColor: theme.colors.primary.backgroundColor,
                                          textColor: theme.colors.primary.backgroundColor,
                                          child: ListTile(
                                            leading: Icon(Icons.settings),
                                            title: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text("Useful links", style: TextStyle(fontWeight: FontWeight.w600)),
                                                Icon(
                                                  Icons.arrow_forward,
                                                  size: 15,
                                                  color: theme.colors.primary.backgroundColor,
                                                )
                                              ],
                                            ),
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
                              padding: EdgeInsets.all(20),
                              child: Container(height: 400, color: theme.colors.primary.backgroundColor)),
                          Padding(
                              padding: EdgeInsets.all(20),
                              child: Container(height: 400, color: theme.colors.primary.backgroundColor)),
                          Padding(
                              padding: EdgeInsets.all(20),
                              child: Container(height: 400, color: theme.colors.primary.backgroundColor)),
                          Padding(
                              padding: EdgeInsets.all(20),
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
