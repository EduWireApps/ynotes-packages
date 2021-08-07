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
  theme = YCurrentTheme(currentTheme: 2, themes: themes);
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent, systemNavigationBarColor: Colors.transparent));
  runApp(Phoenix(child: MyApp()));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          backgroundColor: theme.colors.backgroundLightColor,
          // elevation: 0,
          title: Text(widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: theme.colors.foregroundColor, fontFamily: theme.fonts.primary)),
          actions: [
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
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                YVerticalSpacer(30),
                Row(
                  children: [
                    YButton(
                      onPressed: () {},
                      text: "CONTAINED",
                      variant: YButtonVariant.contained,
                      color: YColor.danger,
                      // isLoading: true,
                    ),
                    YHorizontalSpacer(10),
                    YButton(
                      onPressed: () {},
                      text: "OUTLINED",
                      variant: YButtonVariant.outlined,
                      // isLoading: true,
                    ),
                    YHorizontalSpacer(10),
                    YButton(
                      onPressed: () {},
                      text: "TEXT",
                      variant: YButtonVariant.text,
                      // isLoading: true,
                    ),
                    YHorizontalSpacer(10),
                  ],
                ),
                YVerticalSpacer(30),
                Row(
                  children: [
                    YButton(
                      onPressed: () async {
                        final bool? res = await showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (_) => AlertDialog(
                                  backgroundColor: theme.colors.backgroundColor,
                                  title: Text("Confirmation",
                                      style:
                                          TextStyle(color: theme.colors.foregroundColor, fontWeight: FontWeight.w700)),
                                  content: Text("Cette action est irréversible. T'es sûr(e) de vouloir faire ça ?",
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
                      text: "ANNULER",
                      variant: YButtonVariant.text,
                      // isLoading: true,
                    ),
                    YButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Yay! A SnackBar!')));
                      },
                      text: "CONFIRMER",
                      variant: YButtonVariant.contained,
                      // isLoading: true,
                    ),
                  ],
                ),
                YVerticalSpacer(30),
                Container(
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: YScale.s16),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: YBorderRadius.xl3,
                          color: Colors.blue,
                        ),
                        width: 500,
                        height: 200,
                      ),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          Text(
                            "Ynotes",
                            style: TextStyle(
                                color: theme.colors.foregroundColor,
                                fontSize: 20,
                                height: 1.3,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Text("Rapidly build modern websites without ever leaving your HTML.",
                          style: TextStyle(
                            color: theme.colors.foregroundColor,
                            fontSize: responsive<double>(def: YFontSize.xl4, sm: YFontSize.xl6, lg: YFontSize.xl7),
                            fontWeight: FontWeight.w700,
                            fontFamily: theme.fonts.primary,
                            letterSpacing: YLetterSpacing.tight,
                          )),
                      Text("Ynotes", style: TextStyle(color: theme.colors.foregroundColor, fontSize: YFontSize.xs)),
                      Text("Ynotes", style: TextStyle(color: theme.colors.foregroundColor, fontSize: YFontSize.sm)),
                      Text("Ynotes", style: TextStyle(color: theme.colors.foregroundColor, fontSize: YFontSize.base)),
                      Text("Ynotes", style: TextStyle(color: theme.colors.foregroundColor, fontSize: YFontSize.lg)),
                      Text("Ynotes", style: TextStyle(color: theme.colors.foregroundColor, fontSize: YFontSize.xl2)),
                      Text("Ynotes", style: TextStyle(color: theme.colors.foregroundColor, fontSize: YFontSize.xl3)),
                      Text("Ynotes", style: TextStyle(color: theme.colors.foregroundColor, fontSize: YFontSize.xl4)),
                      Text("Ynotes", style: TextStyle(color: theme.colors.foregroundColor, fontSize: YFontSize.xl5)),
                      Text("Ynotes", style: TextStyle(color: theme.colors.foregroundColor, fontSize: YFontSize.xl6)),
                      Text("Ynotes", style: TextStyle(color: theme.colors.foregroundColor, fontSize: YFontSize.xl7)),
                    ],
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 15,
                  children: [
                    // YButton(
                    //     onPressed: () {
                    //       switch (theme.currentTheme) {
                    //         case 0:
                    //           theme.currentTheme = 1;
                    //           break;
                    //         case 1:
                    //           theme.currentTheme = 2;
                    //           break;
                    //         case 2:
                    //           theme.currentTheme = 0;
                    //           break;
                    //       }
                    //       setState(() {});
                    //     },
                    //     text: "Switch theme: ${theme.name}"),
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
                      color: YColor.danger,
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
                      color: YColor.danger,
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
                              YListDialogElement(title: "Element 1", description: "Awesome description", value: 1),
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
                      color: YColor.warning,
                    ),
                    YButton(
                      onPressed: () async {
                        final List<YListMultipleDialogElement>? res = await YDialogs.getListSelected(
                            context,
                            YListMultipleDialog(
                                header: YDialogHeader(icon: Icons.error, title: "Title", type: YColor.success),
                                min: 1,
                                max: 2,
                                type: YColor.success,
                                elements: [
                                  YListMultipleDialogElement(
                                      id: 0, title: "TEST 1", description: "awesome description", value: false),
                                  YListMultipleDialogElement(
                                      id: 1, title: "TEST 2", description: "awesome description", value: true),
                                  YListMultipleDialogElement(
                                      id: 1, title: "TEST 2", description: "awesome description", value: true),
                                  YListMultipleDialogElement(
                                      id: 1, title: "TEST 2", description: "awesome description", value: true),
                                  YListMultipleDialogElement(
                                      id: 1, title: "TEST 2", description: "awesome description", value: true),
                                  YListMultipleDialogElement(
                                      id: 1, title: "TEST 2", description: "awesome description", value: true),
                                  YListMultipleDialogElement(
                                      id: 1, title: "TEST 2", description: "awesome description", value: true),
                                  YListMultipleDialogElement(
                                      id: 1, title: "TEST 2", description: "awesome description", value: true),
                                  YListMultipleDialogElement(
                                      id: 1, title: "TEST 2", description: "awesome description", value: true),
                                  YListMultipleDialogElement(
                                      id: 1, title: "TEST 2", description: "awesome description", value: true),
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
              ],
            ),
          ),
        ));
  }
}
