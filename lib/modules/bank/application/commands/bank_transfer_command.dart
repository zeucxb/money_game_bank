import '../models/account_model.dart';

class BankTransferCommand {
  final AccountModel payerAccount;
  final AccountModel beneficiaryAccount;
  final double value;

  BankTransferCommand(this.payerAccount, this.beneficiaryAccount, this.value);
}
