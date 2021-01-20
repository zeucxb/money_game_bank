import '../entities/account_entity.dart';

class DeleteAccountCommand {
  final AccountEntity account;

  DeleteAccountCommand(this.account);
}
