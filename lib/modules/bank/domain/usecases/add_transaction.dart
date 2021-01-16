import '../../../../core/usecase/usecase.dart';
import '../../domain/repositories/account_repository.dart';
import '../commands/account_transaction_command.dart';
import '../entities/account_entity.dart';

class AddTransaction implements CommandUseCase<AccountTransactionCommand, AccountEntity> {
  final AccountRepository accountRepository;

  AddTransaction(this.accountRepository);

  @override
  AccountEntity call(AccountTransactionCommand command) {
    assert(command != null);

    final value = command.account.value + command.value;

    return accountRepository.updateById(command.account.id, value);
  }
}
