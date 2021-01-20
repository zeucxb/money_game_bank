import '../../../../core/usecase/usecase.dart';
import '../../domain/repositories/account_repository.dart';
import '../commands/delete_account_command.dart';
import '../entities/account_entity.dart';

class DeleteAccount implements CommandUseCase<DeleteAccountCommand, AccountEntity> {
  final AccountRepository accountRepository;

  DeleteAccount(this.accountRepository);

  @override
  AccountEntity call(DeleteAccountCommand command) {
    assert(command != null);

    accountRepository.delete(command.account.id);

    return command.account;
  }
}
