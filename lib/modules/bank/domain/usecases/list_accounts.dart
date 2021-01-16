import '../../../../core/usecase/usecase.dart';
import '../../domain/repositories/account_repository.dart';
import '../entities/account_entity.dart';

class ListAccounts implements QueryUseCase<List<AccountEntity>> {
  final AccountRepository accountRepository;

  ListAccounts(this.accountRepository);

  @override
  List<AccountEntity> call() {
    return accountRepository.getAll();
  }
}
