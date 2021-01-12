import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:money_game_bank/core/usecase/usecase.dart';
import 'package:money_game_bank/modules/bank/application/commands/delete_account_command.dart';
import 'package:money_game_bank/modules/bank/application/models/account_model.dart';
import 'package:money_game_bank/modules/bank/application/usecases/delete_account.dart';
import 'package:money_game_bank/modules/bank/domain/repositories/account_repository.dart';

class AccountRepositoryMock extends Mock implements AccountRepository {}

main() {
  CommandUseCase<DeleteAccountCommand, AccountModel> usecase;
  AccountRepository accountRepository;

  setUp(() {
    accountRepository = AccountRepositoryMock();
    usecase = DeleteAccount(accountRepository);
  });

  group('DeleteAccount', () {
    test('Should return the deleted account when success', () {
      final account = AccountModel(
        1,
        faker.person.name(),
        faker.randomGenerator.decimal(),
      );

      final command = DeleteAccountCommand(account);

      expect(usecase(command), account);
    });
  });
}
