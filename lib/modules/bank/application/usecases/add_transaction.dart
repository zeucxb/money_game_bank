import '../../../../core/usecase/usecase.dart';
import '../../domain/repositories/account_repository.dart';
import '../commands/account_transaction_command.dart';
import '../models/account_model.dart';

class AddTransaction
    implements CommandUseCase<AccountTransactionCommand, AccountModel> {
  final AccountRepository accountRepository;

  AddTransaction(this.accountRepository);

  @override
  AccountModel call(AccountTransactionCommand command) {
    assert(command != null);

    final value = command.account.value + command.value;

    final updatedAccount =
        accountRepository.updateById(command.account.id, value);

    return AccountModel(
      updatedAccount.id,
      updatedAccount.name,
      updatedAccount.value,
    );
  }
}
