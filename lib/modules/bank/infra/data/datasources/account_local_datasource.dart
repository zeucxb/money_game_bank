import 'package:money_game_bank/core/adapters/local_storege_adapter.dart';

import '../../../domain/entities/account_entity.dart';
import '../models/account_model.dart';
import 'account_datasource.dart';

class AccountLocalDataSourceImpl implements AccountDataSource {
  final LocalStorageAdapter _localStorage;

  AccountLocalDataSourceImpl(this._localStorage);

  @override
  AccountEntity create(AccountModel account) {
    account.setId(_localStorage.nextId());

    _localStorage.save(account);

    return account;
  }

  @override
  List<AccountEntity> list() {
    return _localStorage.list();
  }

  @override
  Future<AccountEntity> update(AccountModel account) async {
    await _localStorage.update(account.id, account);

    return account;
  }

  @override
  Future<void> delete(int id) async {
    await _localStorage.delete(id);
  }

  @override
  Future<void> deleteAll() async {
    await _localStorage.deleteAll();
  }
}
