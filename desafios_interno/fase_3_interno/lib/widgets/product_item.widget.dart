import 'package:fase_3/models/product.model.dart';
import 'package:fase_3/stores/shopping_cart.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_it/get_it.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 1),
        elevation: 0.5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: Image.asset(
                    "assets/iphone.png",
                    key: const Key("productImage"),
                  ),
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
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      "R\$ ${product.price}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text.rich(
                      TextSpan(
                        text: "em ",
                        children: [
                          TextSpan(
                            text: "10x R\$ ${product.price / 10} sem juros",
                            style: const TextStyle(
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 7),
                    const Text(
                      "Frete grátis",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 7),
                    const Text(
                      "Disponível em 6 cores",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 7),
                    RatingBar.builder(
                      itemSize: 15,
                      initialRating: product.rate,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.blue[600],
                        size: 10,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        key: const Key("addProductToCart"),
                        onTap: () {
                          final store = GetIt.I.get<ShoppingCartStore>();
                          final result = store.addProduct(product);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                result
                                    ? 'Produto adicionado!'
                                    : "Produto não adicionado!",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              backgroundColor:
                                  result ? Colors.yellow[300] : Colors.red[300],
                              behavior: SnackBarBehavior.fixed,
                              // showCloseIcon: true,
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
