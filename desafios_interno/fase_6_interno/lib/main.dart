import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_cart/models/shopping_list.model.dart';
import 'package:shopping_cart/pages/add_shopping_list.page.dart';
import 'package:shopping_cart/pages/item_list.page.dart';
import 'package:shopping_cart/routes.dart';
import 'package:shopping_cart/themes/theme.dart';

import 'pages/config.page.dart';
import 'pages/shopping_list.page.dart';
import 'stores/theme.store.dart';

void main() {
  GetIt.I.registerSingleton<ThemeStore>(ThemeStore());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = GetIt.I.get<ThemeStore>();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: store.themeMode,
      builder: (_, themeMode, __) {
        return MaterialApp(
          title: 'Shopping List',
          themeMode: themeMode,
          theme: lightTheme(),
          darkTheme: darkTheme(),
          initialRoute: Routes.shoppingList,
          routes: {
            Routes.shoppingList: (_) => const ShoppingListPage(),
            Routes.addShopping: (_) => const AddShoppingListPage(),
            Routes.itemList: (ctx) => ItemListPage(
                  shoppingList:
                      ModalRoute.of(ctx)!.settings.arguments as ShoppingList,
                ),
            Routes.config: (_) => ConfigPage(),
          },
        );
      },
    );
  }
}
