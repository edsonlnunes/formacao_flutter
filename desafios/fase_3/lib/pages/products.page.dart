import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../stores/products.store.dart';
import '../widgets/appbar_content.widget.dart';
import '../widgets/filter_result.widget.dart';
import '../widgets/product_item.widget.dart';

class ProductsPage extends StatelessWidget {
  final productsStore = GetIt.I.get<ProductsStore>();

  ProductsPage({super.key}) {
    productsStore.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        elevation: 0,
        toolbarHeight: 90,
        title: const AppBarContent(),
      ),
      body: Column(
        children: [
          FilterResult(),
          Expanded(
            child: Observer(
              builder: (ctx) {
                return productsStore.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: productsStore.products.length,
                        itemBuilder: (ctx, index) {
                          final product = productsStore.products[index];
                          return ProductItem(product: product);
                        },
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
