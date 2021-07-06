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
        theme: ThemeData(/*primarySwatch: currentTheme.primary, */ fontFamily: "Asap"),
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
        backgroundColor: currentTheme.colors.neutral.shade100,
        drawer: Drawer(
          child: Container(
            color: currentTheme.colors.neutral.shade200,
          ),
        ),
        appBar: AppBar(
          brightness: currentTheme.isDark ? Brightness.dark : Brightness.light,
          iconTheme: IconThemeData(color: currentTheme.colors.neutral.shade500),
          centerTitle: false,
          backgroundColor: currentTheme.colors.neutral.shade200,
          title: Text(widget.title,
              style: TextStyle(fontWeight: FontWeight.w700, color: currentTheme.colors.neutral.shade500)),
          actions: [
            IconButton(
                onPressed: () {
                  debugPrint("Restart app");
                  Phoenix.rebirth(context);
                },
                icon: Icon(Icons.refresh))
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
                      case YAvailableTheme.light:
                        currentTheme.theme = YAvailableTheme.dark;
                        break;
                      case YAvailableTheme.dark:
                        currentTheme.theme = YAvailableTheme.light;
                        break;
                    }
                    setState(() {});
                  },
                  text: "Switch theme"),
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
                          type: YColor.primary,
                          title: "Hep !",
                          description: "T'es sûr(e) de vouloir faire ça ?",
                          icon: Icons.error_outline,
                        ));
                    print(res);
                  },
                  text: "Toggle",
                  type: YColor.danger,
                  variant: YButtonVariant.reverse),
              YButton(
                  onPressed: () async {
                    await YDialogs.getConfirmation(
                        context,
                        YConfirmationDialog(
                          type: YColor.primary,
                          title: "Hep !",
                          description: "T'es sûr(e) de vouloir faire ça ?",
                          icon: Icons.leaderboard_rounded,
                        ));
                  },
                  text: "Toggle 2",
                  type: YColor.danger,
                  variant: YButtonVariant.reverse),
              YButton(
                onPressed: () {},
                text: "Danger",
                type: YColor.danger,
              ),
              YButton(
                onPressed: () {},
                text: "A really long text",
                type: YColor.warning,
                isLoading: this.loading,
              ),
            ],
          ),
        ));
  }
}
