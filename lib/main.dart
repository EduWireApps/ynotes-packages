import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ynotes_components/components/y_button.dart';
import 'package:ynotes_components/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: MaterialColor(0xff3f49a7, {
            50: Color(0xffeceef8),
            100: Color(0xffc7cbea),
            200: Color(0xffa2a8dc),
            300: Color(0xff7d85ce),
            400: Color(0xff5863c0),
            500: Color(0xff3f49a7),
            600: Color(0xff313982),
            700: Color(0xff23295d),
            800: Color(0xff151838),
            900: Color(0xff070813),
          }),
          fontFamily: "Asap"),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        color: Colors.grey[50],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 4,
                runSpacing: 4,
                children: [
                  YButton(
                    onPressed: () async {
                      final test = await showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                content: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: colors["danger"][50],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(120))),
                                        child: Icon(
                                          Icons.warning,
                                          size: 30,
                                          color: colors["danger"][500],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Attention",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          "Etes-vous sûr de vouloir faire ça ?",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.grey[700])),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: YButton(
                                                onPressed: () => Navigator.pop(
                                                    context, true),
                                                text: "Confirmer",
                                                type: YStyleType.danger),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: YButton(
                                                onPressed: () => Navigator.pop(
                                                    context, false),
                                                text: "Annuler",
                                                type: YStyleType.danger,
                                                variant: YStyleVariant.reverse),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                      print(test);
                    },
                    text: "Primary",
                    variant: YStyleVariant.reverse,
                  ),
                  YButton(
                    onPressed: () {},
                    text: "Secondary",
                    type: YStyleType.secondary,
                    variant: YStyleVariant.reverse,
                  ),
                  YButton(
                      onPressed: () {},
                      text: "Success",
                      type: YStyleType.success),
                  YButton(
                      onPressed: () {},
                      text: "Danger",
                      type: YStyleType.danger),
                  YButton(
                      onPressed: () {},
                      text: "Danger",
                      type: YStyleType.danger,
                      variant: YStyleVariant.reverse),
                  YButton(
                      onPressed: () {},
                      text: "Warning",
                      type: YStyleType.warning),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
