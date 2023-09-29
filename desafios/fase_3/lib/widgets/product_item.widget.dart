import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_it/get_it.dart';
import 'package:mercado_livre/stores/shopping_cart.store.dart';

import '../models/product.model.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    super.key,
    required this.product,
  });

  void addProductInCart(BuildContext context) {
    final store = GetIt.I.get<ShoppingCartStore>();
    final result = store.addProductInCart(product);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          result ? 'Produto adicionado!' : "Produto não adicionado!",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: result ? Colors.yellow[300] : Colors.red[300],
        behavior: SnackBarBehavior.fixed,
        // showCloseIcon: true,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 5),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.grey[300],
                  height: 200,
                  child: Image.asset("assets/iphone.png"),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "R\$ ${product.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text.rich(
                      TextSpan(
                        text: "em ",
                        children: [
                          TextSpan(
                            text:
                                "10x R\$ ${(product.price / 10).toStringAsFixed(2)} sem juros",
                            style: const TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Frete grátis",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Disponível em 6 cores",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RatingBar.builder(
                      itemSize: 15,
                      initialRating: product.rate,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(
                        horizontal: 1,
                      ),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.blue,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => addProductInCart(context),
                        child: const Text(
                          "Add carrinho",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
