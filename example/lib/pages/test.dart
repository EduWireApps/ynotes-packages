import 'package:flutter/material.dart';
import 'package:ynotes_packages/components.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return YPage(
        appBar: YAppBar(
          title: "test page",
          actions: [YButton(onPressed: () {}, text: "ENVOYER", variant: YButtonVariant.text)],
          bottom: const YLinearProgressBar(
              // value: 10,
              ),
        ),
        body: const Text("TEST"));
  }
}
