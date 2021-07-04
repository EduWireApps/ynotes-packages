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
        body: Container(
            color: Colors.grey[100],
            child: Row(
              children: [
                YButton(
                  text: "Primary plain",
                  onPressed: () {},
                  variant: YButtonVariant.plain,
                ),
                YButton(
                  text: "Primary reverse",
                  onPressed: () {},
                  variant: YButtonVariant.reverse,
                ),
              ],
            )));
  }
}
