import '../../application/models/account_model.dart';

class AccountViewModel {
  final int id;
  final String name;
  final double value;

  AccountViewModel(this.id, this.name, this.value);

  toModel() => AccountModel(id, name, value);
}
