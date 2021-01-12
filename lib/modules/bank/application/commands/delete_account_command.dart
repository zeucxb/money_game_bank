import 'package:money_game_bank/modules/bank/application/models/account_model.dart';

class DeleteAccountCommand {
  final AccountModel account;

  DeleteAccountCommand(this.account);
}
