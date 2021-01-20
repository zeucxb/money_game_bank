import '../../../domain/entities/product_entity.dart';
import 'account_model.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    int id,
    String name,
    double value,
    AccountModel owner,
  }) : super(id: id, name: name, value: value, owner: owner);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      value: (json['value'] as num).toDouble(),
      owner: (json['owner'] != null) ? AccountModel.fromJson(json['owner']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'value': value,
      'owner': (owner as AccountModel).toJson(),
    };
  }
}
