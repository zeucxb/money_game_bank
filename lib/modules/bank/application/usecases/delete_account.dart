import '../../../../core/usecase/usecase.dart';
import '../../domain/repositories/account_repository.dart';
import '../commands/delete_account_command.dart';
import '../models/account_model.dart';

class RepositoryError {}

class DeleteAccount
    implements CommandUseCase<DeleteAccountCommand, AccountModel> {
  final AccountRepository accountRepository;

  DeleteAccount(this.accountRepository);

  @override
  AccountModel call(DeleteAccountCommand command) {
    assert(command != null);

    accountRepository.delete(command.account.id);

    return command.account;
  }
}
