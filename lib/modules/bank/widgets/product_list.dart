import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../application/presenters/product_presenter.dart';
import '../application/viewmodels/account_viewmodel.dart';
import '../application/viewmodels/product_viewmodel.dart';
import 'beneficiary_selection_dialog.dart';

class ProductList extends StatelessWidget {
  final ProductPresenter productPresenter;
  final List<AccountViewModel> accounts;

  const ProductList({
    Key key,
    @required this.productPresenter,
    @required this.accounts,
  }) : super(key: key);

  _showBeneficiarySelectionDialog(
    BuildContext context,
    List<AccountViewModel> beneficiaries,
    ProductViewModel product,
  ) async {
    final beneficiaryAccount = await showDialog<AccountViewModel>(
      context: context,
      builder: (_) => BeneficiarySelectionDialog(beneficiaries: beneficiaries),
    );

    if (beneficiaryAccount != null) {
      productPresenter.sell(
        product,
        beneficiaryAccount,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Observer(
        builder: (_) {
          return Column(
            children: productPresenter.products
                .map(
                  (product) => Container(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(product.name),
                        Text(product.value.toString()),
                        IconButton(
                          icon: Icon(Icons.add_business),
                          onPressed: () => _showBeneficiarySelectionDialog(
                            context,
                            accounts,
                            product,
                          ),
                        ),
                        product.owner != null ? Text('(${product.owner.name})') : Container(),
                      ],
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
