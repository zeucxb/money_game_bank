import 'package:mobx/mobx.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/commands/account_transaction_command.dart';
import '../../domain/commands/bank_transfer_command.dart';
import '../../domain/commands/create_account_command.dart';
import '../../domain/commands/delete_account_command.dart';
import '../../domain/entities/account_entity.dart';
import '../viewmodels/account_viewmodel.dart';
import '../viewmodels/transaction_viewmodel.dart';
import '../viewmodels/transfer_viewmodel.dart';

part 'bank_presenter.g.dart';

class BankPresenter = _BankPresenterBase with _$BankPresenter;

abstract class _BankPresenterBase with Store {
  final CommandUseCase<CreateAccountCommand, AccountEntity> _createAccount;
  final QueryUseCase<List<AccountEntity>> _listAccounts;
  final CommandUseCase<AccountTransactionCommand, AccountEntity> _addTransaction;
  final CommandUseCase<AccountTransactionCommand, AccountEntity> _subtractTransaction;
  final CommandUseCase<BankTransferCommand, void> _bankTransfer;
  final CommandUseCase<DeleteAccountCommand, AccountEntity> _deleteAccount;

  _BankPresenterBase(
    this._createAccount,
    this._listAccounts,
    this._addTransaction,
    this._subtractTransaction,
    this._bankTransfer,
    this._deleteAccount,
  );

  @observable
  ObservableList<AccountViewModel> accounts = ObservableList<AccountViewModel>();

  @action
  void create(AccountViewModel account) {
    if (account.name == null || account.name.isEmpty || account.value == null) return;

    final command = CreateAccountCommand(account.name, account.value);

    final createdAccount = _createAccount(command);

    accounts.add(
      AccountViewModel(
        id: createdAccount.id,
        name: createdAccount.name,
        value: createdAccount.value,
      ),
    );
  }

  @action
  void listAccounts() {
    accounts.clear();

    accounts.addAll(
      _listAccounts()
          .map(
            (account) => AccountViewModel(
              id: account.id,
              name: account.name,
              value: account.value,
            ),
          )
          .toList(),
    );
  }

  @action
  void transaction(TransactionViewModel transaction) {
    if (transaction == null || transaction.value == 0) return;

    final transactionCommand = AccountTransactionCommand(
      AccountEntity(
        id: transaction.account.id,
        name: transaction.account.name,
        value: transaction.account.value,
      ),
      transaction.value,
    );

    AccountEntity updatedAccount;

    if (transaction.type == TransactionType.addition) {
      updatedAccount = _addTransaction(transactionCommand);
    } else if (transaction.type == TransactionType.subtraction) {
      updatedAccount = _subtractTransaction(transactionCommand);
    }

    accounts.removeAt(updatedAccount.id - 1);

    accounts.insert(
      updatedAccount.id - 1,
      AccountViewModel(
        id: updatedAccount.id,
        name: updatedAccount.name,
        value: updatedAccount.value,
      ),
    );
  }

  List<AccountViewModel> getBeneficiaries(AccountViewModel account) => [...accounts]..remove(account);

  void bankTransfer(TransferViewModel transfer) {
    if (transfer == null || transfer.value == 0) return;

    _bankTransfer(
      BankTransferCommand(
        AccountEntity(
          id: transfer.payerAccount.id,
          name: transfer.payerAccount.name,
          value: transfer.payerAccount.value,
        ),
        AccountEntity(
          id: transfer.beneficiaryAccount.id,
          name: transfer.beneficiaryAccount.name,
          value: transfer.beneficiaryAccount.value,
        ),
        transfer.value,
      ),
    );

    listAccounts();
  }

  delete(AccountViewModel account) {
    _deleteAccount(
      DeleteAccountCommand(
        AccountEntity(
          id: account.id,
          name: account.name,
          value: account.value,
        ),
      ),
    );

    listAccounts();
  }
}
