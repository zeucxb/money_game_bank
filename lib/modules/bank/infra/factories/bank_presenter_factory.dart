import 'package:hive/hive.dart';

import '../../../../core/adapters/local_storage_adapter.dart';
import '../../../../core/factory/factory.dart';
import '../../application/presenters/bank_presenter.dart';
import '../../domain/usecases/add_transaction.dart';
import '../../domain/usecases/bank_transfer.dart';
import '../../domain/usecases/create_account.dart';
import '../../domain/usecases/delete_account.dart';
import '../../domain/usecases/delete_all_accounts.dart';
import '../../domain/usecases/list_accounts.dart';
import '../../domain/usecases/subtract_transaction.dart';
import '../data/datasources/account_local_datasource.dart';
import '../data/models/account_model.dart';
import '../data/repositories/account_repository.dart';

class BankPresenterFactory implements Factory<Future<BankPresenter>> {
  @override
  Future<BankPresenter> call() async {
    final box = await Hive.openBox<AccountModel>('accounts');
    final accountRepository = AccountRepositoryImpl(
      AccountLocalDataSourceImpl(
        LocalStorageAdapter(box),
      ),
    );

    return BankPresenter(
      CreateAccount(accountRepository),
      ListAccounts(accountRepository),
      AddTransaction(accountRepository),
      SubtractTransaction(accountRepository),
      BankTransfer(accountRepository),
      DeleteAccount(accountRepository),
      DeleteAllAccounts(accountRepository),
    );
  }
}
