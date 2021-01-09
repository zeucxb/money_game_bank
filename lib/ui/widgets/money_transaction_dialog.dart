import 'package:flutter/material.dart';

import '../../utils/enums/transaction_type.dart';

class MoneyTransactionDialog extends StatefulWidget {
  final TransactionType transactionType;

  const MoneyTransactionDialog({Key key, @required this.transactionType})
      : super(key: key);

  @override
  _MoneyTransactionDialogState createState() => _MoneyTransactionDialogState();
}

class _MoneyTransactionDialogState extends State<MoneyTransactionDialog> {
  final TextEditingController _txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var title = 'Adicionar';

    if (widget.transactionType == TransactionType.subtraction) {
      title = 'Subtrair';
    }

    return AlertDialog(
      title: Text(title),
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
