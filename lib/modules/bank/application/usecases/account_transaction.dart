import '../../../../core/application/usecase.dart';
import '../../../../utils/enums/transaction_type.dart';
import '../../domain/repositories/account_repository.dart';
import '../commands/account_transaction_command.dart';
import '../models/account_model.dart';

class AccountTransaction
    implements CommandUseCase<AccountTransactionCommand, AccountModel> {
  final AccountRepository accountRepository;

  AccountTransaction(this.accountRepository);

  @override
  AccountModel call(AccountTransactionCommand command) {
    assert(command != null);

    var value;

    if (command.type == TransactionType.addition) {
      value = command.oldValue + command.newValue;
    } else {
      value = command.oldValue - command.newValue;
    }

    final updatedAccount = accountRepository.updateById(command.id, value);

    return AccountModel(
      updatedAccount.id,
      updatedAccount.name,
      updatedAccount.value,
    );
  }
}
