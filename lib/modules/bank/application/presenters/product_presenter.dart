import 'package:mobx/mobx.dart';

import '../../../../core/usecase/command_usecase.dart';
import '../../../../core/usecase/query_usecase.dart';
import '../../domain/commands/create_product_command.dart';
import '../../domain/commands/sell_product_command.dart';
import '../../domain/entities/account_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../viewmodels/account_viewmodel.dart';
import '../viewmodels/product_viewmodel.dart';

part 'product_presenter.g.dart';

class ProductPresenter = _ProductPresenterBase with _$ProductPresenter;

abstract class _ProductPresenterBase with Store {
  final CommandUseCase<CreateProductCommand, ProductEntity> _createProduct;
  final QueryUseCase<List<ProductEntity>> _listProducts;
  final CommandUseCase<SellProductCommand, ProductEntity> _sellProduct;

  _ProductPresenterBase(this._createProduct, this._listProducts, this._sellProduct);

  @observable
  ObservableList<ProductViewModel> products = ObservableList<ProductViewModel>();

  @action
  create(ProductViewModel product) {
    final createdProduct = _createProduct(
      CreateProductCommand(
        name: product.name,
        value: product.value,
      ),
    );

    products.add(
      ProductViewModel(
        id: createdProduct.id,
        name: createdProduct.name,
        value: createdProduct.value,
      ),
    );
  }

  @action
  void listProducts() {
    products.clear();

    products.addAll(
      _listProducts()
          .map(
            (product) => ProductViewModel(
              id: product.id,
              name: product.name,
              value: product.value,
              owner: product.owner != null
                  ? AccountViewModel(
                      id: product.owner.id,
                      name: product.owner.name,
                      value: product.owner.value,
                    )
                  : null,
            ),
          )
          .toList(),
    );
  }

  void sell(ProductViewModel product, AccountViewModel account) {
    _sellProduct(
      SellProductCommand(
        product: ProductEntity(
          id: product.id,
          name: product.name,
          value: product.value,
        ),
        account: AccountEntity(
          id: account.id,
          name: account.name,
          value: account.value,
        ),
      ),
    );

    listProducts();
  }
}
