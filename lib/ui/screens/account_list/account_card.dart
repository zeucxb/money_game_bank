import 'package:flutter/material.dart';

import '../../../modules/bank/presentation/presenters/bank_presenter.dart';
import '../../../modules/bank/presentation/viewmodels/account_viewmodel.dart';
import '../../../utils/enums/transaction_type.dart';
import '../../widgets/money_transaction_dialog.dart';

class AccountCard extends StatelessWidget {
  final AccountViewModel account;
  final BankPresenter bankPresenter;

  const AccountCard(
      {Key key, @required this.account, @required this.bankPresenter})
      : assert(account != null && bankPresenter != null),
        super(key: key);

  _showTransactionDialog(
    BuildContext context,
    AccountViewModel account,
    TransactionType transactionType,
  ) async {
    final result = await showDialog<double>(
      context: context,
      builder: (_) => MoneyTransactionDialog(
        transactionType: transactionType,
      ),
    );

    if (result != null) {
      bankPresenter.transaction(account, result, transactionType);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(account.name),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                child: Text(
                  'R\$ ${account.value}',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.remove_circle_outline,
                    ),
                    iconSize: 50,
                    onPressed: () => _showTransactionDialog(
                      context,
                      account,
                      TransactionType.subtraction,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    iconSize: 50,
                    onPressed: () => _showTransactionDialog(
                      context,
                      account,
                      TransactionType.addition,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
