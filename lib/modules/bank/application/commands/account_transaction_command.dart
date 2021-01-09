import '../models/account_model.dart';

class AccountTransactionCommand {
  final AccountModel account;
  final double value;

  AccountTransactionCommand(this.account, this.value);
}
