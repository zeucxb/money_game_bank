import '../../domain/entities/account_entity.dart';
import '../../domain/repositories/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final List<AccountEntity> accountList = [];

  @override
  AccountEntity save(AccountEntity accountEntity) {
    accountEntity.setId(accountList.length + 1);
    accountList.add(accountEntity);

    return accountEntity;
  }

  @override
  List<AccountEntity> getAll() {
    return accountList;
  }

  @override
  AccountEntity updateById(int id, double value) {
    final currentAccount = accountList[id - 1];

    final newAccount = AccountEntity(currentAccount.name, value, id);

    accountList.removeAt(id - 1);

    accountList.insert(id - 1, newAccount);

    return newAccount;
  }

  @override
  void delete(int id) {
    accountList.removeAt(id - 1);
  }
}
