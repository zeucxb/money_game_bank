import 'package:meta/meta.dart';

class CreateProductCommand {
  final String name;
  final double value;

  CreateProductCommand({
    @required this.name,
    @required this.value,
  });
}
