import 'package:flutter/material.dart';

class MoneyTransactionDialog extends StatefulWidget {
  final String title;

  const MoneyTransactionDialog({Key key, @required this.title})
      : assert(title != null),
        super(key: key);

  @override
  _MoneyTransactionDialogState createState() => _MoneyTransactionDialogState();
}

class _MoneyTransactionDialogState extends State<MoneyTransactionDialog> {
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
