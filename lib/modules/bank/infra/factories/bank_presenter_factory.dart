import 'package:money_game_bank/modules/bank/application/usecases/add_transaction.dart';
import 'package:money_game_bank/modules/bank/application/usecases/subtract_transaction%20copy.dart';

import '../../../../core/infra/factory.dart';
import '../../application/usecases/bank_transfer.dart';
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
        AddTransaction(accountRepository),
        SubtractTransaction(accountRepository),
        BankTransfer(accountRepository),
      );
}
