import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/account_entity.dart';
import '../../domain/repositories/account_repository.dart';
import '../commands/create_account_command.dart';

class CreateAccount implements CommandUseCase<CreateAccountCommand, AccountEntity> {
  final AccountRepository accountRepository;

  CreateAccount(this.accountRepository);

  @override
  AccountEntity call(CreateAccountCommand command) {
    assert(command != null);

    final account = AccountEntity(
      name: command.name,
      value: command.value,
    );

    return accountRepository.save(account);
  }
}
