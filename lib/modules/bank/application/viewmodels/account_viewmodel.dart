import 'package:flutter/foundation.dart';

class AccountViewModel {
  final int id;
  final String name;
  final double value;

  AccountViewModel({
    this.id,
    @required this.name,
    @required this.value,
  });
}
