import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mercado_livre/stores/shopping_cart.store.dart';

import '../pages/shopping_cart.page.dart';

class ShoppingCartIcon extends StatelessWidget {
  const ShoppingCartIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ShoppingCartPage(),
          ),
        );
      },
      child: Observer(
        builder: (context) {
          // return Badge.count(
          //   count: GetIt.I.get<ShoppingCartStore>().productsInCart.length,
          //   child: const Icon(
          //     Icons.shopping_cart_outlined,
          //   ),
          // );
          return Badge(
            badgeContent: Text(
              GetIt.I.get<ShoppingCartStore>().productsInCart.length.toString(),
            ),
            child: const Icon(
              Icons.shopping_cart_outlined,
            ),
          );
        },
      ),
    );
  }
}
