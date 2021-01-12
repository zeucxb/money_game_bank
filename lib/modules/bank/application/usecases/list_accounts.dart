import '../../../../core/usecase/usecase.dart';
import '../../domain/repositories/account_repository.dart';
import '../models/account_model.dart';

class ListAccounts implements QueryUseCase<List<AccountModel>> {
  final AccountRepository accountRepository;

  ListAccounts(this.accountRepository);

  @override
  List<AccountModel> call([_]) {
    final accountList = accountRepository.getAll();

    return accountList
        .map((account) => AccountModel(account.id, account.name, account.value))
        .toList();
  }
}
