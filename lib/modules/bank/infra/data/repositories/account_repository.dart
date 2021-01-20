import '../../../domain/entities/account_entity.dart';
import '../../../domain/repositories/account_repository.dart';
import '../datasources/account_datasource.dart';
import '../models/account_model.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountDataSource _accountDataSource;

  AccountRepositoryImpl(this._accountDataSource);

  @override
  AccountEntity save(AccountEntity accountEntity) {
    return _accountDataSource.create(
      AccountModel.fromEntity(accountEntity),
    );
  }

  @override
  List<AccountEntity> getAll() {
    return _accountDataSource.list();
  }

  @override
  Future<AccountEntity> update(AccountEntity accountEntity) async {
    return _accountDataSource.update(
      AccountModel.fromEntity(accountEntity),
    );
  }

  @override
  Future<void> delete(int id) async {
    await _accountDataSource.delete(id);
  }

  @override
  Future<void> deleteAll() async {
    await _accountDataSource.deleteAll();
  }
}
