import '../../../../core/usecase/command_usecase.dart';
import '../commands/sell_product_command.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class SellProduct implements CommandUseCase<SellProductCommand, ProductEntity> {
  final ProductRepository _repository;

  SellProduct(this._repository);

  @override
  ProductEntity call(SellProductCommand command) {
    return _repository.sell(
      command.product,
      command.account,
    );
  }
}
