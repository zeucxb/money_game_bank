import 'account_viewmodel.dart';

class BankViewModel {
  final List<AccountViewModel> accounts;

  List<AccountViewModel> getBeneficiaries(AccountViewModel account) =>
      [...accounts]..remove(account);

  BankViewModel(this.accounts);
}
