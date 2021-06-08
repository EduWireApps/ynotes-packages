import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ynotes_components/components/y_button.dart';
import 'package:ynotes_components/components/y_choice_dialog.dart';
import 'package:ynotes_components/constants.dart';
import 'package:ynotes_components/mixins.dart';

import 'package:sizer/sizer.dart';

import 'components/texts.dart';

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
        theme: ThemeData(primarySwatch: YColors.primary, fontFamily: "Asap"),
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

class _MyHomePageState extends State<MyHomePage> with YDialogMixin {
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
        title:
            Text(widget.title, style: TextStyle(fontWeight: FontWeight.w700)),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              YH1("Heading 1"),
              YH2("Heading 2"),
              YH3("Heading 3"),
              YTextBody("Text body"),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 4,
                runSpacing: 4,
                children: [
                  YButton(
                    onPressed: () async {
                      final res = await getChoice(YChoiceDialog());
                      print(res);
                    },
                    text: "Primary",
                    variant: YButtonVariant.reverse,
                  ),
                  YButton(
                    onPressed: () async {
                      final res = await getChoice(YChoiceDialog(
                        type: YColor.secondary,
                      ));
                      print(res);
                    },
                    text: "Secondary",
                    type: YColor.secondary,
                    variant: YButtonVariant.reverse,
                  ),
                  YButton(
                    onPressed: () => setState(() {
                      this.loading = !this.loading;
                    }),
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
                  YButton(
                      onPressed: () {}, text: "Neutral", type: YColor.neutral),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
