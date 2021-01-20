import '../../../../core/usecase/usecase.dart';
import '../../domain/repositories/account_repository.dart';
import '../commands/account_transaction_command.dart';
import '../entities/account_entity.dart';

class SubtractTransaction implements CommandUseCase<AccountTransactionCommand, Future<AccountEntity>> {
  final AccountRepository accountRepository;

  SubtractTransaction(this.accountRepository);

  @override
  Future<AccountEntity> call(AccountTransactionCommand command) async {
    assert(command != null);

    final account = command.account;
    final value = account.value - command.value;

    return accountRepository.update(
      AccountEntity(
        id: account.id,
        name: account.name,
        value: value,
      ),
    );
  }
}
