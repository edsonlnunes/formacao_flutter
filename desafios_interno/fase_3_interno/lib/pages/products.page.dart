import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../stores/products.store.dart';
import '../widgets/content_appbar.widget.dart';
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
        title: const ContentAppBar(),
        toolbarHeight: 85,
      ),
      body: Column(
        children: [
          FilterResult(),
          Expanded(
            child: Observer(
              builder: (context) {
                return productsStore.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: productsStore.products.length,
                        itemBuilder: (ctx, index) {
                          return ProductItem(
                            key: const Key("productItem"),
                            product: productsStore.products[index],
                          );
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
