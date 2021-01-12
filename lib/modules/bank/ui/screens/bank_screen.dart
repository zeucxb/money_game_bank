import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../infra/factories/bank_presenter_factory.dart';
import '../../presentation/presenters/bank_presenter.dart';
import '../../presentation/viewmodels/account_viewmodel.dart';
import '../../presentation/viewmodels/transaction_viewmodel.dart';
import '../../presentation/viewmodels/transfer_viewmodel.dart';
import '../widgets/account_card.dart';
import '../widgets/beneficiary_selection_dialog.dart';
import '../widgets/create_account_dialog.dart';
import '../widgets/money_transaction_dialog.dart';

class BankScreen extends StatelessWidget {
  final BankPresenter bankPresenter = BankPresenterFactory().call()
    ..listAccounts();

  List<AccountViewModel> get accounts => bankPresenter.accounts;

  _showCreateAccountDialog(
    BuildContext context,
  ) async {
    final name = await showDialog<String>(
      context: context,
      builder: (_) => CreateAccountDialog(),
    );

    if (name != null) {
      bankPresenter.create(
        AccountViewModel(
          name: name,
          value: 1000,
        ),
      );
    }
  }

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
      builder: (_) => MoneyTransactionDialog(
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
      builder: (_) => MoneyTransactionDialog(
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
    return Scaffold(
      appBar: AppBar(
        title: Text('BANK'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateAccountDialog(context),
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: accounts
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
              ),
            );
          },
        ),
      ),
    );
  }
}
