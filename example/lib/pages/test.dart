import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:ynotes_packages/components.dart';
import 'package:ynotes_packages/settings.dart';
import 'package:ynotes_packages/theme.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return YPage(
        appBar: const YAppBar(
          title: "test page",
          // value: 10,
        ),
        body: Column(
          children: [
            Container(
                width: 50,
                height: 50,
                color: responsive<Color>(
                    def: Colors.red,
                    sm: Colors.orange,
                    md: Colors.yellow,
                    lg: Colors.green,
                    xl: Colors.blue,
                    xxl: Colors.indigo)),
          ],
        ));
  }
}
