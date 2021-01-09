import 'package:mobx/mobx.dart';

import '../../../../core/application/usecase.dart';
import '../../../../utils/enums/transaction_type.dart';
import '../../application/commands/account_transaction_command.dart';
import '../../application/commands/create_account_command.dart';
import '../../application/models/account_model.dart';
import '../viewmodels/account_viewmodel.dart';

part 'bank_presenter.g.dart';

class BankPresenterParams {
  final String name;
  final double value;

  BankPresenterParams(this.name, this.value);
}

class BankPresenter = _BankPresenterBase with _$BankPresenter;

abstract class _BankPresenterBase with Store {
  final CommandUseCase<CreateAccountCommand, AccountModel> _createAccount;
  final QueryUseCase<List<AccountModel>> _listAccounts;
  final CommandUseCase<AccountTransactionCommand, AccountModel>
      _accountTransaction;

  _BankPresenterBase(
      this._createAccount, this._listAccounts, this._accountTransaction);

  @observable
  ObservableList<AccountViewModel> accounts =
      ObservableList<AccountViewModel>();

  @action
  void create(BankPresenterParams params) {
    final command = CreateAccountCommand(params.name, params.value);

    final account = _createAccount(command);

    accounts.add(AccountViewModel(account.id, account.name, account.value));
  }

  @action
  void listAccounts() {
    accounts.clear();

    accounts.addAll(
      _listAccounts()
          .map(
            (account) =>
                AccountViewModel(account.id, account.name, account.value),
          )
          .toList(),
    );
  }

  @action
  void transaction(
    AccountViewModel account,
    double value,
    TransactionType type,
  ) {
    final updatedAccount = _accountTransaction(
      AccountTransactionCommand(account.id, account.value, value, type),
    );

    accounts.removeAt(account.id - 1);

    accounts.insert(
      account.id - 1,
      AccountViewModel(
        updatedAccount.id,
        updatedAccount.name,
        updatedAccount.value,
      ),
    );
  }
}
