import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:money_game_bank/core/usecase/usecase.dart';
import 'package:money_game_bank/modules/bank/domain/commands/delete_account_command.dart';
import 'package:money_game_bank/modules/bank/domain/entities/account_entity.dart';
import 'package:money_game_bank/modules/bank/domain/repositories/account_repository.dart';
import 'package:money_game_bank/modules/bank/domain/usecases/delete_account.dart';

class AccountRepositoryMock extends Mock implements AccountRepository {}

main() {
  CommandUseCase<DeleteAccountCommand, AccountEntity> usecase;
  AccountRepository accountRepository;

  setUp(() {
    accountRepository = AccountRepositoryMock();
    usecase = DeleteAccount(accountRepository);
  });

  group('DeleteAccount', () {
    test('Should return the deleted account when success', () {
      final account = AccountEntity(
        id: 1,
        name: faker.person.name(),
        value: faker.randomGenerator.decimal(),
      );

      final command = DeleteAccountCommand(account);

      expect(usecase(command), account);
    });
  });
}
