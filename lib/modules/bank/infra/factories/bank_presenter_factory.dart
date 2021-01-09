import '../../../../core/infra/factory.dart';
import '../../application/usecases/account_transaction.dart';
import '../../application/usecases/create_account.dart';
import '../../application/usecases/list_accounts.dart';
import '../../presentation/presenters/bank_presenter.dart';
import '../repositories/account_repository_adapter.dart';

class BankPresenterFactory implements Factory<BankPresenter> {
  final accountRepository = AccountRepositoryAdapter();

  @override
  BankPresenter call() => BankPresenter(
        CreateAccount(accountRepository),
        ListAccounts(accountRepository),
        AccountTransaction(accountRepository),
      );
}
