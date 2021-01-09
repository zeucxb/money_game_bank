import 'package:mobx/mobx.dart';

import '../../../../core/application/usecase.dart';
import '../../application/commands/account_transaction_command.dart';
import '../../application/commands/bank_transfer_command.dart';
import '../../application/commands/create_account_command.dart';
import '../../application/models/account_model.dart';
import '../viewmodels/account_viewmodel.dart';
import '../viewmodels/transaction_viewmodel.dart';
import '../viewmodels/transfer_viewmodel.dart';

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
  final CommandUseCase<AccountTransactionCommand, AccountModel> _addTransaction;
  final CommandUseCase<AccountTransactionCommand, AccountModel>
      _subtractTransaction;
  final CommandUseCase<BankTransferCommand, void> _bankTransfer;

  _BankPresenterBase(
    this._createAccount,
    this._listAccounts,
    this._addTransaction,
    this._subtractTransaction,
    this._bankTransfer,
  );

  @observable
  ObservableList<AccountViewModel> accounts =
      ObservableList<AccountViewModel>();

  @action
  void create(BankPresenterParams params) {
    if (params.name == null || params.name.isEmpty || params.value == null)
      return;

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
  void transaction(TransactionViewModel transaction) {
    if (transaction == null || transaction.value == 0) return;

    final transactionCommand = AccountTransactionCommand(
      transaction.account.toModel(),
      transaction.value,
    );

    AccountModel updatedAccount;

    if (transaction.type == TransactionType.addition) {
      updatedAccount = _addTransaction(transactionCommand);
    } else if (transaction.type == TransactionType.subtraction) {
      updatedAccount = _subtractTransaction(transactionCommand);
    }

    accounts.removeAt(updatedAccount.id - 1);

    accounts.insert(
      updatedAccount.id - 1,
      AccountViewModel(
        updatedAccount.id,
        updatedAccount.name,
        updatedAccount.value,
      ),
    );
  }

  List<AccountViewModel> getBeneficiaries(AccountViewModel account) =>
      [...accounts]..remove(account);

  void bankTransfer(TransferViewModel transfer) {
    if (transfer == null || transfer.value == 0) return;

    _bankTransfer(
      BankTransferCommand(
        transfer.payerAccount.toModel(),
        transfer.beneficiaryAccount.toModel(),
        transfer.value,
      ),
    );

    listAccounts();
  }
}
