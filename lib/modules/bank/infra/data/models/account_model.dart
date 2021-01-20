import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/account_entity.dart';

part 'account_model.g.dart';

@HiveType(typeId: 0)
class AccountModel extends AccountEntity with HiveObject, EquatableMixin {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  double value;

  AccountModel({
    this.id,
    @required this.name,
    @required this.value,
  }) : super(id: id, name: name, value: value);

  factory AccountModel.fromEntity(AccountEntity accountEntity) => AccountModel(
        id: accountEntity.id,
        name: accountEntity.name,
        value: accountEntity.value,
      );

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'],
      name: json['name'],
      value: (json['value'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'value': value,
    };
  }

  @override
  List<Object> get props => [id, name, value];
}
