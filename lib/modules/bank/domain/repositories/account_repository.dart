import '../entities/account_entity.dart';

abstract class AccountRepository {
  AccountEntity save(AccountEntity accountEntity);
  List<AccountEntity> getAll();
  Future<AccountEntity> update(AccountEntity accountEntity);
  Future<void> delete(int id);
  Future<void> deleteAll();
}
