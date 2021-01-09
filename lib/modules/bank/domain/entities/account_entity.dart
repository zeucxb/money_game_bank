class AccountEntity {
  int id;
  final String name;
  final double value;

  AccountEntity(this.name, this.value, [this.id]);

  void setId(value) => id = value;
}
