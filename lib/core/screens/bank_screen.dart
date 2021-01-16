import 'package:flutter/material.dart';

import '../../modules/bank/application/presenters/bank_presenter.dart';
import '../../modules/bank/application/presenters/product_presenter.dart';
import '../../modules/bank/application/viewmodels/account_viewmodel.dart';
import '../../modules/bank/application/viewmodels/product_viewmodel.dart';
import '../../modules/bank/infra/factories/bank_presenter_factory.dart';
import '../../modules/bank/infra/factories/product_presenter_factory.dart';
import '../../modules/bank/widgets/product_list.dart';
import '../../modules/bank/widgets/users_list.dart';
import '../ui/widgets/money_value_dialog.dart';
import '../ui/widgets/string_value_dialog.dart';

class BankScreen extends StatelessWidget {
  final BankPresenter bankPresenter = BankPresenterFactory().call()..listAccounts();
  final ProductPresenter productPresenter = ProductPresenterFactory().call()..listProducts();

  _showStringValueDialog(
    BuildContext context,
  ) async {
    final name = await showDialog<String>(
      context: context,
      builder: (_) => StringValueDialog(title: 'Criar Conta'),
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

  _showCreateProductDialog(
    BuildContext context,
  ) async {
    final name = await showDialog<String>(
      context: context,
      builder: (_) => StringValueDialog(title: 'Nome do Produto'),
    );

    final value = await showDialog<double>(
      context: context,
      builder: (_) => MoneyValueDialog(
        title: 'Valor',
      ),
    );

    if (name != null && value != null) {
      productPresenter.create(
        ProductViewModel(
          name: name,
          value: value,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('BANK'),
          bottom: TabBar(
            tabs: <Widget>[
              Text('Playes'),
              Text('Products'),
            ],
          ),
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () => DefaultTabController.of(context).index == 0 ? _showStringValueDialog(context) : _showCreateProductDialog(context),
            child: Icon(Icons.add),
          );
        }),
        body: TabBarView(
          children: [
            UsersList(
              bankPresenter: bankPresenter,
            ),
            ProductList(
              productPresenter: productPresenter,
              accounts: bankPresenter.accounts,
            ),
          ],
        ),
      ),
    );
  }
}
