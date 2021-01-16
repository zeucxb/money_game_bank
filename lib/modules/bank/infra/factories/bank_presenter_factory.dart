import '../../../../core/factory/factory.dart';
import '../../application/presenters/bank_presenter.dart';
import '../../domain/usecases/add_transaction.dart';
import '../../domain/usecases/bank_transfer.dart';
import '../../domain/usecases/create_account.dart';
import '../../domain/usecases/delete_account.dart';
import '../../domain/usecases/list_accounts.dart';
import '../../domain/usecases/subtract_transaction.dart';
import '../repositories/account_repository.dart';

class BankPresenterFactory implements Factory<BankPresenter> {
  final accountRepository = AccountRepositoryImpl();

  @override
  BankPresenter call() => BankPresenter(
        CreateAccount(accountRepository),
        ListAccounts(accountRepository),
        AddTransaction(accountRepository),
        SubtractTransaction(accountRepository),
        BankTransfer(accountRepository),
        DeleteAccount(accountRepository),
      );
}
