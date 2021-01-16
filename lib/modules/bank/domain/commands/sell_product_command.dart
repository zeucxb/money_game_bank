import 'package:meta/meta.dart';

import '../entities/account_entity.dart';
import '../entities/product_entity.dart';

class SellProductCommand {
  final ProductEntity product;
  final AccountEntity account;

  SellProductCommand({
    @required this.product,
    @required this.account,
  });
}
