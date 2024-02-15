
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:h6/HomePage.dart';
import 'package:h6/data_layer/user.dart';

void main() {
  GetIt.instance.registerLazySingleton<UserDataService>(() => UserDataService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: HomePage(),
    );
  }
}

