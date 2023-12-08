// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartScreenStore on _CartScreenStore, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: '_CartScreenStore.state'))
          .value;

  late final _$cartFutureAtom =
      Atom(name: '_CartScreenStore.cartFuture', context: context);

  @override
  ObservableFuture<graphql.QueryResult<CartModel>?>? get cartFuture {
    _$cartFutureAtom.reportRead();
    return super.cartFuture;
  }

  @override
  set cartFuture(ObservableFuture<graphql.QueryResult<CartModel>?>? value) {
    _$cartFutureAtom.reportWrite(value, super.cartFuture, () {
      super.cartFuture = value;
    });
  }

  late final _$cartQueryResultAtom =
      Atom(name: '_CartScreenStore.cartQueryResult', context: context);

  @override
  graphql.QueryResult<CartModel>? get cartQueryResult {
    _$cartQueryResultAtom.reportRead();
    return super.cartQueryResult;
  }

  @override
  set cartQueryResult(graphql.QueryResult<CartModel>? value) {
    _$cartQueryResultAtom.reportWrite(value, super.cartQueryResult, () {
      super.cartQueryResult = value;
    });
  }

  late final _$cartModelAtom =
      Atom(name: '_CartScreenStore.cartModel', context: context);

  @override
  CartModel? get cartModel {
    _$cartModelAtom.reportRead();
    return super.cartModel;
  }

  @override
  set cartModel(CartModel? value) {
    _$cartModelAtom.reportWrite(value, super.cartModel, () {
      super.cartModel = value;
    });
  }

  @override
  ObservableFuture<void> getCartItems() {
    final _$future = super.getCartItems();
    return ObservableFuture<void>(_$future, context: context);
  }

  @override
  String toString() {
    return '''
cartFuture: ${cartFuture},
cartQueryResult: ${cartQueryResult},
cartModel: ${cartModel},
state: ${state}
    ''';
  }
}
