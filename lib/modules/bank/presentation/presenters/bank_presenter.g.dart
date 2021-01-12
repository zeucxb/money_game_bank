// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_presenter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BankPresenter on _BankPresenterBase, Store {
  final _$accountsAtom = Atom(name: '_BankPresenterBase.accounts');

  @override
  ObservableList<AccountViewModel> get accounts {
    _$accountsAtom.reportRead();
    return super.accounts;
  }

  @override
  set accounts(ObservableList<AccountViewModel> value) {
    _$accountsAtom.reportWrite(value, super.accounts, () {
      super.accounts = value;
    });
  }

  final _$_BankPresenterBaseActionController =
      ActionController(name: '_BankPresenterBase');

  @override
  void create(AccountViewModel account) {
    final _$actionInfo = _$_BankPresenterBaseActionController.startAction(
        name: '_BankPresenterBase.create');
    try {
      return super.create(account);
    } finally {
      _$_BankPresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void listAccounts() {
    final _$actionInfo = _$_BankPresenterBaseActionController.startAction(
        name: '_BankPresenterBase.listAccounts');
    try {
      return super.listAccounts();
    } finally {
      _$_BankPresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void transaction(TransactionViewModel transaction) {
    final _$actionInfo = _$_BankPresenterBaseActionController.startAction(
        name: '_BankPresenterBase.transaction');
    try {
      return super.transaction(transaction);
    } finally {
      _$_BankPresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
accounts: ${accounts}
    ''';
  }
}
