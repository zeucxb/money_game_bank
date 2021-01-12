import '../../../../core/usecase/usecase.dart';
import '../../domain/repositories/account_repository.dart';
import '../commands/bank_transfer_command.dart';

class BankTransfer implements CommandUseCase<BankTransferCommand, void> {
  final AccountRepository accountRepository;

  BankTransfer(this.accountRepository);

  @override
  void call(command) {
    assert(command != null);

    final payerNewValue = command.payerAccount.value - command.value;
    final beneficiaryNewValue =
        command.beneficiaryAccount.value + command.value;

    accountRepository.updateById(
      command.payerAccount.id,
      payerNewValue,
    );
    accountRepository.updateById(
      command.beneficiaryAccount.id,
      beneficiaryNewValue,
    );
  }
}
