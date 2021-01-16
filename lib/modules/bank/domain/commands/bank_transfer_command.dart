import '../entities/account_entity.dart';

class BankTransferCommand {
  final AccountEntity payerAccount;
  final AccountEntity beneficiaryAccount;
  final double value;

  BankTransferCommand(this.payerAccount, this.beneficiaryAccount, this.value);
}
