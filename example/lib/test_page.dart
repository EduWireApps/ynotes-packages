import 'package:flutter/material.dart';
import 'package:ynotes_components/ynotes_components.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          // title: Text('SliverAppBar'),
          expandedHeight: 150,
          backgroundColor: currentTheme.colors.neutral.shade200,
          flexibleSpace: FlexibleSpaceBar(title: Text("Résumé")),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          backButton(context),
        ])),
        SliverFixedExtentList(
          itemExtent: 150.0,
          delegate: SliverChildListDelegate(
            [
              Container(color: Colors.red),
              Container(color: Colors.purple),
              Container(color: Colors.green),
              Container(color: Colors.orange),
              Container(color: Colors.yellow),
              Container(color: Colors.pink),
            ],
          ),
        ),
      ],
    ));
  }

  Widget backButton(BuildContext context) => ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Go back!'),
      );
}
