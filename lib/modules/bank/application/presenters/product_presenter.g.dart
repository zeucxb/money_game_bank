// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_presenter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductPresenter on _ProductPresenterBase, Store {
  final _$productsAtom = Atom(name: '_ProductPresenterBase.products');

  @override
  ObservableList<ProductViewModel> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<ProductViewModel> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$_ProductPresenterBaseActionController =
      ActionController(name: '_ProductPresenterBase');

  @override
  dynamic create(ProductViewModel product) {
    final _$actionInfo = _$_ProductPresenterBaseActionController.startAction(
        name: '_ProductPresenterBase.create');
    try {
      return super.create(product);
    } finally {
      _$_ProductPresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void listProducts() {
    final _$actionInfo = _$_ProductPresenterBaseActionController.startAction(
        name: '_ProductPresenterBase.listProducts');
    try {
      return super.listProducts();
    } finally {
      _$_ProductPresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
