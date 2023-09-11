import 'package:flutter/material.dart';
import 'package:shopping_cart/models/shopping_list.model.dart';

import '../themes/app_colors.dart';

class CardShoppingCart extends StatelessWidget {
  final ShoppingList shoppingList;
  const CardShoppingCart({super.key, required this.shoppingList});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>();
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  shoppingList.name,
                  style: theme.textTheme.titleSmall,
                ),
                Text(
                  "${shoppingList.qtdBuyedItems}/${shoppingList.items.length}",
                  style: theme.textTheme.titleSmall!
                      .copyWith(color: appColors!.primaryColor),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            LinearProgressIndicator(
              backgroundColor: appColors.progressBackground,
              valueColor: AlwaysStoppedAnimation(appColors.primaryColor),
              value: shoppingList.items.isEmpty
                  ? 0
                  : (shoppingList.qtdBuyedItems / shoppingList.items.length),
              minHeight: 6,
            ),
          ],
        ),
      ),
    );
  }
}
