import '../../domain/entities/account_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final List<ProductEntity> products = [];

  @override
  ProductEntity create(ProductEntity productEntity) {
    productEntity.setId(products.length + 1);
    products.add(productEntity);

    return productEntity;
  }

  @override
  List<ProductEntity> getAll() {
    return products;
  }

  @override
  ProductEntity sell(ProductEntity product, AccountEntity account) {
    final currentProduct = products[product.id - 1];

    currentProduct.setOwner(account);

    products.removeAt(product.id - 1);

    products.insert(product.id - 1, currentProduct);

    return product;
  }
}
