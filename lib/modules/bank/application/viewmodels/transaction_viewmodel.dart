import 'account_viewmodel.dart';

enum TransactionType { addition, subtraction }

class TransactionViewModel {
  final TransactionType type;
  final AccountViewModel account;
  final double value;

  TransactionViewModel(this.type, this.account, this.value);
}
