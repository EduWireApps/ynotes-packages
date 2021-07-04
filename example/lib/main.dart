import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:ynotes_components/ynotes_components.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(/*primarySwatch: currentTheme.primary, */ fontFamily: "Asap"),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
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

class _MyHomePageState extends State<MyHomePage> /*with YDialogMixin*/ {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Container(
            color: Color(0xff3f49a7),
          ),
        ),
        appBar: AppBar(
          centerTitle: false,
          title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.w700)),
        ),
        body: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 15,
            children: [
              YButton(
                onPressed: () => setState(() {
                  this.loading = !this.loading;
                }),
                text: "Update loading",
                type: YColor.success,
                icon: Icons.check_circle,
              ),
              YButton(
                onPressed: () => setState(() {
                  this.loading = !this.loading;
                }),
                reverseIconAndText: true,
                text: "Update loading",
                type: YColor.success,
                icon: Icons.check_circle,
              ),
              YButton(
                onPressed: () {},
                text: "Danger",
                type: YColor.danger,
              ),
              YButton(
                onPressed: () {},
                text: "Danger",
                type: YColor.danger,
                variant: YButtonVariant.reverse,
                isDisabled: true,
              ),
              YButton(
                onPressed: () {},
                text: "A really long text",
                type: YColor.warning,
                isLoading: this.loading,
              ),
              YButton(onPressed: () {}, text: "Neutral", type: YColor.neutral),
            ],
          ),
        ));
  }
}
