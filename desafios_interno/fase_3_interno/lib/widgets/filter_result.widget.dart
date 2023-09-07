import 'package:fase_3/stores/products.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class FilterResult extends StatelessWidget {
  final productsStore = GetIt.I.get<ProductsStore>();

  FilterResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Observer(builder: (context) {
              return Text(
                productsStore.products.isEmpty
                    ? "Nenhum resultado..."
                    : "100 resultados",
              );
            }),
            Row(
              children: [
                Text(
                  "Filtrar (2)",
                  style: TextStyle(color: Colors.blue[600]),
                ),
                Icon(
                  Icons.expand_more,
                  color: Colors.blue[600],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
