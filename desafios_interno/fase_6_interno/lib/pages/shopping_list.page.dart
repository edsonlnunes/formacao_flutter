import 'package:flutter/material.dart';
import 'package:shopping_cart/models/item_list.model.dart';
import 'package:shopping_cart/routes.dart';
import 'package:shopping_cart/widgets/card_shopping_cart.widget.dart';
import 'package:shopping_cart/widgets/empty_shopping_list.widget.dart';

import '../models/shopping_list.model.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  final shoppingList = <ShoppingList>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minhas listas"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.diamond,
              color: Colors.amber,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.config);
            },
            icon: const Icon(
              Icons.settings,
              size: 30,
            ),
          ),
        ],
      ),
      body: shoppingList.isEmpty
          ? const EmptyShoppingList()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              itemCount: shoppingList.length,
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () => navigateToItemList(shoppingList[index]),
                  onLongPress: () => deleteList(index),
                  child: CardShoppingCart(
                    shoppingList: shoppingList[index],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewList,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> navigateToItemList(ShoppingList shoppingList) async {
    final itemsLits = await Navigator.of(context)
        .pushNamed(Routes.itemList, arguments: shoppingList) as List<ItemList>?;

    if (itemsLits != null) {
      setState(() {
        shoppingList.items.clear();
        shoppingList.items.addAll(itemsLits);
      });
    }
  }

  void deleteList(int index) {
    setState(() {
      shoppingList.removeAt(index);
    });
  }

  Future<void> addNewList() async {
    final nameList =
        await Navigator.of(context).pushNamed(Routes.addShopping) as String?;

    if (nameList != null) {
      setState(() {
        shoppingList.add(ShoppingList(name: nameList));
      });
    }
  }
}
