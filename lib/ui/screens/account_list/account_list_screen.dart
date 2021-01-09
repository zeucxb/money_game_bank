import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../widgets/create_account_dialog.dart';
import 'account_card.dart';

import '../../../modules/bank/infra/factories/bank_presenter_factory.dart';
import '../../../modules/bank/presentation/presenters/bank_presenter.dart';

class AccountListScreen extends StatelessWidget {
  final BankPresenter bankPresenter = BankPresenterFactory().call()
    ..listAccounts();

  _showCreateAccountDialog(
    BuildContext context,
  ) async {
    final name = await showDialog<String>(
      context: context,
      builder: (_) => CreateAccountDialog(),
    );

    if (name != null) {
      bankPresenter.create(BankPresenterParams(name, 1000));
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
                children: [
                  ...bankPresenter.accounts
                      .map(
                        (account) => AccountCard(
                          account: account,
                          bankPresenter: bankPresenter,
                        ),
                      )
                      .toList(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
