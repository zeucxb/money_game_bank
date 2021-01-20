import 'package:flutter/material.dart';

import 'core/screens/bank_screen.dart';
import 'core/setup/setup.dart';

void main() async {
  await SetUp().call();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BankScreen(),
    );
  }
}
