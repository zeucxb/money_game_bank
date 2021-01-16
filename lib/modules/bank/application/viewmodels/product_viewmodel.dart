import 'account_viewmodel.dart';

class ProductViewModel {
  final int id;
  final String name;
  final double value;
  final AccountViewModel owner;

  ProductViewModel({
    this.id,
    this.name,
    this.value,
    this.owner,
  });
}
