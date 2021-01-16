import '../entities/account_entity.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository {
  ProductEntity create(ProductEntity product);
  List<ProductEntity> getAll();
  ProductEntity sell(ProductEntity product, AccountEntity account);
}
