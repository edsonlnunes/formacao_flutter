// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShoppingCartStore on ShoppingCartStoreBase, Store {
  late final _$productsInCartAtom =
      Atom(name: 'ShoppingCartStoreBase.productsInCart', context: context);

  @override
  ObservableList<Product> get productsInCart {
    _$productsInCartAtom.reportRead();
    return super.productsInCart;
  }

  @override
  set productsInCart(ObservableList<Product> value) {
    _$productsInCartAtom.reportWrite(value, super.productsInCart, () {
      super.productsInCart = value;
    });
  }

  late final _$ShoppingCartStoreBaseActionController =
      ActionController(name: 'ShoppingCartStoreBase', context: context);

  @override
  bool addProductInCart(Product product) {
    final _$actionInfo = _$ShoppingCartStoreBaseActionController.startAction(
        name: 'ShoppingCartStoreBase.addProductInCart');
    try {
      return super.addProductInCart(product);
    } finally {
      _$ShoppingCartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productsInCart: ${productsInCart}
    ''';
  }
}
