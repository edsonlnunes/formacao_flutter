import 'package:mobx/mobx.dart';

import '../models/product.model.dart';

part 'shopping_cart.store.g.dart';

class ShoppingCartStore = ShoppingCartStoreBase with _$ShoppingCartStore;

abstract class ShoppingCartStoreBase with Store {
  @observable
  ObservableList<Product> productsCart = <Product>[].asObservable();

  @action
  bool addProduct(Product product) {
    if (productsCart.any((p) => p.id == product.id)) {
      return false;
    }

    productsCart.add(product);
    return true;
  }
}
