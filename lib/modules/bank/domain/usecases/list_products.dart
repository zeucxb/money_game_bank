import '../../../../core/usecase/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class ListProducts implements QueryUseCase<List<ProductEntity>> {
  final ProductRepository productRepository;

  ListProducts(this.productRepository);

  @override
  List<ProductEntity> call() {
    return productRepository.getAll();
  }
}
