import 'package:flutter/material.dart';

class MoneyValueDialog extends StatefulWidget {
  final String title;

  const MoneyValueDialog({Key key, @required this.title})
      : assert(title != null),
        super(key: key);

  @override
  _MoneyValueDialogState createState() => _MoneyValueDialogState();
}

class _MoneyValueDialogState extends State<MoneyValueDialog> {
  final TextEditingController _txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextFormField(
        controller: _txtController,
        keyboardType: TextInputType.number,
      ),
      actions: [
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancelar',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(
              context,
              double.parse(_txtController.text),
            );
          },
          child: const Text(
            'Confirmar',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
