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
        body: Column(
          children: [
            const Text("TEST"),
            YButton(
                onPressed: () async {
                  final res = await YDialogs.getInput(
                      context,
                      YInputDialog(
                          title: "Code",
                          input: YFormField(
                            type: YFormFieldInputType.number,
                            label: "Code",
                            properties: YFormFieldProperties(),
                            maxLength: 4,
                          )));
                  print(res);
                },
                text: "open input dialog")
          ],
        ));
  }
}
