import '../../../../core/usecase/usecase.dart';
import '../repositories/account_repository.dart';

class DeleteAllAccounts implements QueryUseCase<Future<void>> {
  final AccountRepository accountRepository;

  DeleteAllAccounts(this.accountRepository);

  @override
  Future<void> call() async {
    await accountRepository.deleteAll();
  }
}
