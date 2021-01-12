import '../entities/account_entity.dart';

abstract class AccountRepository {
  AccountEntity save(AccountEntity accountEntity);
  List<AccountEntity> getAll();
  AccountEntity updateById(int id, double value);
  void delete(int id);
}
