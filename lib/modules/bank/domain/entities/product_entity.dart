import 'account_entity.dart';

class ProductEntity {
  int id;
  final String name;
  final double value;
  AccountEntity owner;

  ProductEntity({
    this.id,
    this.name,
    this.value,
    this.owner,
  });

  setId(int value) => id = value;

  setOwner(AccountEntity account) => owner = account;
}
