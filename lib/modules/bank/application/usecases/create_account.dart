import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/account_entity.dart';
import '../../domain/repositories/account_repository.dart';
import '../commands/create_account_command.dart';
import '../models/account_model.dart';

class CreateAccount
    implements CommandUseCase<CreateAccountCommand, AccountModel> {
  final AccountRepository accountRepository;

  CreateAccount(this.accountRepository);

  @override
  AccountModel call(CreateAccountCommand command) {
    assert(command != null);

    final account = AccountEntity(command.name, command.value);

    final createdAccount = accountRepository.save(account);

    return AccountModel(
      createdAccount.id,
      createdAccount.name,
      createdAccount.value,
    );
  }
}
