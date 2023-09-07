import 'package:flutter/material.dart';

import 'address_info.widget.dart';
import 'search_products.widget.dart';
import 'shopping_cart_icon.widget.dart';

class ContentAppBar extends StatelessWidget {
  const ContentAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: SearchProducts(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ShoppingCartIcon(),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const AddressInfo()
      ],
    );
  }
}
