part of components;

class YForm extends StatefulWidget {
  final List<YFormField> fields;

  const YForm({Key? key, required this.fields}) : super(key: key);

  @override
  _YFormState createState() => _YFormState();
}

class _YFormState extends State<YForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: widget.fields,
    ));
  }
}
