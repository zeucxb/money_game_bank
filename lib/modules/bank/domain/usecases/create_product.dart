import '../../../../core/usecase/command_usecase.dart';
import '../commands/create_product_command.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class CreateProduct implements CommandUseCase<CreateProductCommand, ProductEntity> {
  final ProductRepository _repository;

  CreateProduct(this._repository);

  @override
  ProductEntity call(CreateProductCommand command) {
    return _repository.create(ProductEntity(name: command.name, value: command.value));
  }
}
