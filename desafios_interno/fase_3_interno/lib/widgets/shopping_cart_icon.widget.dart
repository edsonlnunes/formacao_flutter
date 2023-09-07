import 'package:fase_3/pages/shopping_cart.page.dart';
import 'package:fase_3/stores/shopping_cart.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ShoppingCartIcon extends StatelessWidget {
  final shoppingCartStore = GetIt.I.get<ShoppingCartStore>();

  ShoppingCartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ShoppingCartPage()),
        );
      },
      child: Center(
        child: Observer(
          builder: (context) {
            return Badge.count(
              count: shoppingCartStore.productsCart.length,
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
            );
          },
        ),
      ),
    );
  }
}
