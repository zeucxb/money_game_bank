import '../../../domain/entities/account_entity.dart';
import '../models/account_model.dart';

abstract class AccountDataSource {
  AccountEntity create(AccountModel account);
  List<AccountEntity> list();
  Future<AccountEntity> update(AccountModel account);
  Future<void> delete(int id);
  Future<void> deleteAll();
}
