import 'package:fase_3/pages/products.page.dart';
import 'package:fase_3/stores/products.store.dart';
import 'package:fase_3/stores/shopping_cart.store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton<ShoppingCartStore>(ShoppingCartStore());
  GetIt.I.registerSingleton<ProductsStore>(ProductsStore());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductsPage(),
    );
  }
}
