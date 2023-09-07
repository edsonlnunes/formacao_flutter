import 'package:mobx/mobx.dart';

import '../models/product.model.dart';

part 'shopping_cart.store.g.dart';

class ShoppingCartStore = ShoppingCartStoreBase with _$ShoppingCartStore;

abstract class ShoppingCartStoreBase with Store {
  @observable
  ObservableList<Product> productsCart = <Product>[].asObservable();

  @action
  void addProduct(Product product) {
    productsCart.add(product);
  }
}
