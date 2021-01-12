import 'package:flutter/foundation.dart';

import '../../application/models/account_model.dart';

class AccountViewModel {
  final int id;
  final String name;
  final double value;

  AccountViewModel({
    this.id,
    @required this.name,
    @required this.value,
  });

  AccountModel toModel() => AccountModel(id, name, value);
}
