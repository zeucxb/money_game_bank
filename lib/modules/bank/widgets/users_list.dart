import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/ui/widgets/money_value_dialog.dart';
import '../application/presenters/bank_presenter.dart';
import '../application/viewmodels/account_viewmodel.dart';
import '../application/viewmodels/transaction_viewmodel.dart';
import '../application/viewmodels/transfer_viewmodel.dart';
import 'account_card.dart';
import 'beneficiary_selection_dialog.dart';

class UsersList extends StatelessWidget {
  const UsersList({
    Key key,
    @required this.bankPresenter,
  }) : super(key: key);

  final BankPresenter bankPresenter;

  List<AccountViewModel> get accounts => bankPresenter.accounts;

  _showTransactionDialog(
    BuildContext context,
    AccountViewModel account,
    TransactionType transactionType,
  ) async {
    String title;

    if (transactionType == TransactionType.addition) {
      title = 'Adicionar';
    } else if (transactionType == TransactionType.subtraction) {
      title = 'Subtrair';
    }

    final value = await showDialog<double>(
      context: context,
      builder: (_) => MoneyValueDialog(
        title: title,
      ),
    );

    if (value != null) {
      bankPresenter.transaction(
        TransactionViewModel(transactionType, account, value),
      );
    }
  }

  _showBeneficiarySelectionDialog(
    BuildContext context,
    List<AccountViewModel> beneficiaries,
    AccountViewModel account,
  ) async {
    final value = await showDialog<double>(
      context: context,
      builder: (_) => MoneyValueDialog(
        title: 'Transferir',
      ),
    );

    if (value == null) {
      return;
    }

    final beneficiaryAccount = await showDialog<AccountViewModel>(
      context: context,
      builder: (_) => BeneficiarySelectionDialog(beneficiaries: beneficiaries),
    );

    if (beneficiaryAccount != null) {
      bankPresenter.bankTransfer(
        TransferViewModel(account, beneficiaryAccount, value),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Observer(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                accounts.length > 0
                    ? InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          width: double.infinity,
                          child: Center(
                            child: Text('CLEAR'),
                          ),
                        ),
                        onTap: () => bankPresenter.deleteAll(),
                      )
                    : Container(),
                ...accounts
                    .map(
                      (account) => AccountCard(
                        account: account,
                        bankPresenter: bankPresenter,
                        actions: [
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
                          if (accounts.length > 1)
                            IconButton(
                              icon: Icon(
                                Icons.send,
                              ),
                              iconSize: 50,
                              onPressed: () => _showBeneficiarySelectionDialog(
                                context,
                                bankPresenter.getBeneficiaries(account),
                                account,
                              ),
                            ),
                        ],
                      ),
                    )
                    .toList(),
              ],
            ),
          );
        },
      ),
    );
  }
}
