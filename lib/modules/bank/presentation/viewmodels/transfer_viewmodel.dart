import 'account_viewmodel.dart';

class TransferViewModel {
  final AccountViewModel payerAccount;
  final AccountViewModel beneficiaryAccount;
  final double value;

  TransferViewModel(this.payerAccount, this.beneficiaryAccount, this.value);
}
