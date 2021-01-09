import '../../../../utils/enums/transaction_type.dart';

class AccountTransactionCommand {
  final int id;
  final double oldValue;
  final double newValue;
  final TransactionType type;

  AccountTransactionCommand(this.id, this.oldValue, this.newValue, this.type);
}
