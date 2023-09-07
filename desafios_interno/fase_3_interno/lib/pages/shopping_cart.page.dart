import 'package:fase_3/stores/shopping_cart.store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ShoppingCartPage extends StatelessWidget {
  final shoppingCartStore = GetIt.I.get<ShoppingCartStore>();

  ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        title: const Text("Carrinho de compras"),
      ),
      body: shoppingCartStore.productsCart.isEmpty
          ? Center(
              child: Image.asset(
                "assets/empty_cart.png",
                height: 200,
              ),
            )
          : ListView.builder(
              itemCount: shoppingCartStore.productsCart.length,
              itemBuilder: (ctx, index) {
                final product = shoppingCartStore.productsCart[index];
                return Text(product.name);
              },
            ),
    );
  }
}
