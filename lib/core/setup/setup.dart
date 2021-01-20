import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../modules/bank/infra/data/models/account_model.dart';

class SetUp {
  Future<void> call() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AccountModelAdapter());
  }
}
