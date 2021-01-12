import 'package:flutter/material.dart';

import '../../presentation/presenters/bank_presenter.dart';
import '../../presentation/viewmodels/account_viewmodel.dart';

class AccountCard extends StatelessWidget {
  final AccountViewModel account;
  final BankPresenter bankPresenter;
  final List<Widget> actions;

  const AccountCard({
    Key key,
    @required this.account,
    @required this.bankPresenter,
    this.actions = const [],
  })  : assert(account != null && bankPresenter != null),
        super(key: key);

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
                children: actions,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
