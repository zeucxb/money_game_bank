import 'package:flutter/material.dart';

import '../../modules/bank/presentation/viewmodels/account_viewmodel.dart';

class BeneficiarySelectionDialog extends StatefulWidget {
  final List<AccountViewModel> beneficiaries;

  const BeneficiarySelectionDialog({Key key, @required this.beneficiaries})
      : super(key: key);

  @override
  _BeneficiarySelectionDialogState createState() =>
      _BeneficiarySelectionDialogState();
}

class _BeneficiarySelectionDialogState
    extends State<BeneficiarySelectionDialog> {
  AccountViewModel beneficiary;

  @override
  Widget build(BuildContext context) {
    var title = 'Transferir';

    return AlertDialog(
      title: Text(title),
      content: DropdownButton<AccountViewModel>(
        hint: Text('Selecione um beneficiário'),
        items: widget.beneficiaries.map((AccountViewModel account) {
          return DropdownMenuItem<AccountViewModel>(
            value: account,
            child: Text(account.name),
          );
        }).toList(),
        value: beneficiary,
        onChanged: (selectedBeneficiary) {
          setState(() {
            beneficiary = selectedBeneficiary;
          });
        },
      ),
      actions: [
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancelar'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(
              context,
              beneficiary,
            );
          },
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}
