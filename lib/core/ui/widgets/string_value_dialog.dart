import 'package:flutter/material.dart';

class StringValueDialog extends StatefulWidget {
  final String title;

  const StringValueDialog({Key key, @required this.title})
      : assert(title != null),
        super(key: key);

  @override
  _StringValueDialogState createState() => _StringValueDialogState();
}

class _StringValueDialogState extends State<StringValueDialog> {
  final TextEditingController _txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextFormField(
        controller: _txtController,
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
              _txtController.text,
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
