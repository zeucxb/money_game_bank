import 'package:meta/meta.dart';

class AccountEntity {
  int id;
  final String name;
  final double value;

  AccountEntity({
    this.id,
    @required this.name,
    @required this.value,
  });

  void setId(value) => id = value;
}
