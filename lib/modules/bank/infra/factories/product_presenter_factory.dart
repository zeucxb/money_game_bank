import '../../../../core/factory/factory.dart';
import '../../application/presenters/product_presenter.dart';
import '../../domain/usecases/create_product.dart';
import '../../domain/usecases/list_products.dart';
import '../../domain/usecases/sell_product.dart';
import '../repositories/product_repository.dart';

class ProductPresenterFactory implements Factory<ProductPresenter> {
  final productRepository = ProductRepositoryImpl();

  @override
  ProductPresenter call() => ProductPresenter(
        CreateProduct(productRepository),
        ListProducts(productRepository),
        SellProduct(productRepository),
      );
}
