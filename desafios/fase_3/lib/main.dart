import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mercado_livre/pages/products.page.dart';
import 'package:mercado_livre/stores/products.store.dart';
import 'package:mercado_livre/stores/shopping_cart.store.dart';

void main() {
  GetIt.I.registerSingleton<ProductsStore>(ProductsStore());
  GetIt.I.registerSingleton<ShoppingCartStore>(ShoppingCartStore());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercado livre',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: ProductsPage(),
    );
  }
}
