import 'package:example/test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:sizer/sizer.dart';
import 'package:ynotes_components/ynotes_components.dart';

void main() {
  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(fontFamily: "Asap", accentColor: currentTheme.colors.primary.shade300),
        home: MyHomePage(title: 'Demo'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: currentTheme.colors.neutral.shade200,
        drawer: Drawer(
          child: Container(
            color: currentTheme.colors.neutral.shade100,
          ),
        ),
        appBar: AppBar(
          brightness: currentTheme.isDark ? Brightness.dark : Brightness.light,
          iconTheme: IconThemeData(color: currentTheme.colors.neutral.shade500),
          centerTitle: false,
          backgroundColor: currentTheme.colors.neutral.shade100,
          title: Text(widget.title,
              style: TextStyle(fontWeight: FontWeight.w700, color: currentTheme.colors.neutral.shade500)),
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
        body: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 15,
            children: [
              YButton(
                  onPressed: () {
                    switch (currentTheme.theme) {
                      case YAvailableTheme.system:
                        currentTheme.theme = YAvailableTheme.light;
                        break;
                      case YAvailableTheme.light:
                        currentTheme.theme = YAvailableTheme.dark;
                        break;
                      case YAvailableTheme.dark:
                        currentTheme.theme = YAvailableTheme.system;
                        break;
                    }
                    setState(() {});
                  },
                  text: "Switch theme: ${currentTheme.name}"),
              YButton(
                onPressed: () => setState(() {
                  this.loading = !this.loading;
                }),
                text: "Update loading",
                type: YColor.success,
                icon: Icons.check_circle,
              ),
              YButton(
                  onPressed: () async {
                    final bool res = await YDialogs.getChoice(
                        context,
                        YChoiceDialog(
                          type: YColor.warning,
                          title: "Hep !",
                          description: "T'es sûr(e) de vouloir faire ça ?",
                          icon: Icons.error_outline,
                        ));
                    print(res);
                  },
                  text: "Choice",
                  type: YColor.danger,
                  variant: YButtonVariant.reverse),
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
                  type: YColor.danger,
                  variant: YButtonVariant.reverse),
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
                type: YColor.danger,
              ),
              YButton(
                onPressed: () {},
                text: "A really long text",
                type: YColor.warning,
                isLoading: this.loading,
              ),
              YButton(onPressed: () {}, text: "Neutral", type: YColor.neutral),
              YButton(
                onPressed: () {},
                text: "Reverse",
                type: YColor.neutral,
                variant: YButtonVariant.reverse,
              ),
            ],
          ),
        ));
  }
}
