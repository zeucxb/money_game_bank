import 'package:money_game_bank/modules/bank/application/usecases/delete_account.dart';

import '../../../../core/factory/factory.dart';
import '../../application/usecases/add_transaction.dart';
import '../../application/usecases/bank_transfer.dart';
import '../../application/usecases/create_account.dart';
import '../../application/usecases/list_accounts.dart';
import '../../application/usecases/subtract_transaction.dart';
import '../../presentation/presenters/bank_presenter.dart';
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
