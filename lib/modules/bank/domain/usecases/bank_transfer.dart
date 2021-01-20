import '../../../../core/usecase/usecase.dart';
import '../../domain/repositories/account_repository.dart';
import '../commands/bank_transfer_command.dart';
import '../entities/account_entity.dart';

class BankTransfer implements CommandUseCase<BankTransferCommand, Future<void>> {
  final AccountRepository accountRepository;

  BankTransfer(this.accountRepository);

  @override
  Future<void> call(command) async {
    assert(command != null);

    final payerAccount = command.payerAccount;
    final beneficiaryAccount = command.beneficiaryAccount;

    final payerNewValue = payerAccount.value - command.value;
    final beneficiaryNewValue = beneficiaryAccount.value + command.value;

    await accountRepository.update(
      AccountEntity(
        id: payerAccount.id,
        name: payerAccount.name,
        value: payerNewValue,
      ),
    );

    await accountRepository.update(
      AccountEntity(
        id: beneficiaryAccount.id,
        name: beneficiaryAccount.name,
        value: beneficiaryNewValue,
      ),
    );
  }
}
