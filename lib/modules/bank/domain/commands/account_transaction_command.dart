import '../entities/account_entity.dart';

class AccountTransactionCommand {
  final AccountEntity account;
  final double value;

  AccountTransactionCommand(this.account, this.value);
}
