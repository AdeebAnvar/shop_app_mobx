// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SingleProductStore on _SingleProductStore, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: '_SingleProductStore.state'))
          .value;

  late final _$singleProductFutureAtom =
      Atom(name: '_SingleProductStore.singleProductFuture', context: context);

  @override
  ObservableFuture<graphql.QueryResult<SingleProductModel>?>?
      get singleProductFuture {
    _$singleProductFutureAtom.reportRead();
    return super.singleProductFuture;
  }

  @override
  set singleProductFuture(
      ObservableFuture<graphql.QueryResult<SingleProductModel>?>? value) {
    _$singleProductFutureAtom.reportWrite(value, super.singleProductFuture, () {
      super.singleProductFuture = value;
    });
  }

  late final _$createEmptyCartFutureAtom =
      Atom(name: '_SingleProductStore.createEmptyCartFuture', context: context);

  @override
  ObservableFuture<graphql.QueryResult<CreateEmptyCartModel>?>?
      get createEmptyCartFuture {
    _$createEmptyCartFutureAtom.reportRead();
    return super.createEmptyCartFuture;
  }

  @override
  set createEmptyCartFuture(
      ObservableFuture<graphql.QueryResult<CreateEmptyCartModel>?>? value) {
    _$createEmptyCartFutureAtom.reportWrite(value, super.createEmptyCartFuture,
        () {
      super.createEmptyCartFuture = value;
    });
  }

  late final _$addProductToCartFutureAtom = Atom(
      name: '_SingleProductStore.addProductToCartFuture', context: context);

  @override
  ObservableFuture<graphql.QueryResult<AddProductsToCart>?>?
      get addProductToCartFuture {
    _$addProductToCartFutureAtom.reportRead();
    return super.addProductToCartFuture;
  }

  @override
  set addProductToCartFuture(
      ObservableFuture<graphql.QueryResult<AddProductsToCart>?>? value) {
    _$addProductToCartFutureAtom
        .reportWrite(value, super.addProductToCartFuture, () {
      super.addProductToCartFuture = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: '_SingleProductStore.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$singleProductQueryResultAtom = Atom(
      name: '_SingleProductStore.singleProductQueryResult', context: context);

  @override
  graphql.QueryResult<SingleProductModel>? get singleProductQueryResult {
    _$singleProductQueryResultAtom.reportRead();
    return super.singleProductQueryResult;
  }

  @override
  set singleProductQueryResult(graphql.QueryResult<SingleProductModel>? value) {
    _$singleProductQueryResultAtom
        .reportWrite(value, super.singleProductQueryResult, () {
      super.singleProductQueryResult = value;
    });
  }

  late final _$createEmptyCartModelQueryResultAtom = Atom(
      name: '_SingleProductStore.createEmptyCartModelQueryResult',
      context: context);

  @override
  graphql.QueryResult<CreateEmptyCartModel>?
      get createEmptyCartModelQueryResult {
    _$createEmptyCartModelQueryResultAtom.reportRead();
    return super.createEmptyCartModelQueryResult;
  }

  @override
  set createEmptyCartModelQueryResult(
      graphql.QueryResult<CreateEmptyCartModel>? value) {
    _$createEmptyCartModelQueryResultAtom
        .reportWrite(value, super.createEmptyCartModelQueryResult, () {
      super.createEmptyCartModelQueryResult = value;
    });
  }

  late final _$addProductsToCartModelQueryResultAtom = Atom(
      name: '_SingleProductStore.addProductsToCartModelQueryResult',
      context: context);

  @override
  graphql.QueryResult<AddProductsToCart>?
      get addProductsToCartModelQueryResult {
    _$addProductsToCartModelQueryResultAtom.reportRead();
    return super.addProductsToCartModelQueryResult;
  }

  @override
  set addProductsToCartModelQueryResult(
      graphql.QueryResult<AddProductsToCart>? value) {
    _$addProductsToCartModelQueryResultAtom
        .reportWrite(value, super.addProductsToCartModelQueryResult, () {
      super.addProductsToCartModelQueryResult = value;
    });
  }

  late final _$addProductToCartModelQueryResultAtom = Atom(
      name: '_SingleProductStore.addProductToCartModelQueryResult',
      context: context);

  @override
  graphql.QueryResult<AddProductsToCart>? get addProductToCartModelQueryResult {
    _$addProductToCartModelQueryResultAtom.reportRead();
    return super.addProductToCartModelQueryResult;
  }

  @override
  set addProductToCartModelQueryResult(
      graphql.QueryResult<AddProductsToCart>? value) {
    _$addProductToCartModelQueryResultAtom
        .reportWrite(value, super.addProductToCartModelQueryResult, () {
      super.addProductToCartModelQueryResult = value;
    });
  }

  late final _$singleProductDataAtom =
      Atom(name: '_SingleProductStore.singleProductData', context: context);

  @override
  SingleProductModel? get singleProductData {
    _$singleProductDataAtom.reportRead();
    return super.singleProductData;
  }

  @override
  set singleProductData(SingleProductModel? value) {
    _$singleProductDataAtom.reportWrite(value, super.singleProductData, () {
      super.singleProductData = value;
    });
  }

  late final _$createEmptyCartModelAtom =
      Atom(name: '_SingleProductStore.createEmptyCartModel', context: context);

  @override
  CreateEmptyCartModel? get createEmptyCartModel {
    _$createEmptyCartModelAtom.reportRead();
    return super.createEmptyCartModel;
  }

  @override
  set createEmptyCartModel(CreateEmptyCartModel? value) {
    _$createEmptyCartModelAtom.reportWrite(value, super.createEmptyCartModel,
        () {
      super.createEmptyCartModel = value;
    });
  }

  late final _$addProductsToCartAtom =
      Atom(name: '_SingleProductStore.addProductsToCart', context: context);

  @override
  AddProductsToCart? get addProductsToCart {
    _$addProductsToCartAtom.reportRead();
    return super.addProductsToCart;
  }

  @override
  set addProductsToCart(AddProductsToCart? value) {
    _$addProductsToCartAtom.reportWrite(value, super.addProductsToCart, () {
      super.addProductsToCart = value;
    });
  }

  late final _$isSelectedDetailsTabAtom =
      Atom(name: '_SingleProductStore.isSelectedDetailsTab', context: context);

  @override
  bool get isSelectedDetailsTab {
    _$isSelectedDetailsTabAtom.reportRead();
    return super.isSelectedDetailsTab;
  }

  @override
  set isSelectedDetailsTab(bool value) {
    _$isSelectedDetailsTabAtom.reportWrite(value, super.isSelectedDetailsTab,
        () {
      super.isSelectedDetailsTab = value;
    });
  }

  late final _$hideAppBarAtom =
      Atom(name: '_SingleProductStore.hideAppBar', context: context);

  @override
  bool get hideAppBar {
    _$hideAppBarAtom.reportRead();
    return super.hideAppBar;
  }

  @override
  set hideAppBar(bool value) {
    _$hideAppBarAtom.reportWrite(value, super.hideAppBar, () {
      super.hideAppBar = value;
    });
  }

  late final _$selectedValuesByRowAtom =
      Atom(name: '_SingleProductStore.selectedValuesByRow', context: context);

  @override
  ObservableMap<String, ObservableSet<String>> get selectedValuesByRow {
    _$selectedValuesByRowAtom.reportRead();
    return super.selectedValuesByRow;
  }

  @override
  set selectedValuesByRow(ObservableMap<String, ObservableSet<String>> value) {
    _$selectedValuesByRowAtom.reportWrite(value, super.selectedValuesByRow, () {
      super.selectedValuesByRow = value;
    });
  }

  late final _$loadingStringAtom =
      Atom(name: '_SingleProductStore.loadingString', context: context);

  @override
  String get loadingString {
    _$loadingStringAtom.reportRead();
    return super.loadingString;
  }

  @override
  set loadingString(String value) {
    _$loadingStringAtom.reportWrite(value, super.loadingString, () {
      super.loadingString = value;
    });
  }

  late final _$getSingleProductDataAsyncAction =
      AsyncAction('_SingleProductStore.getSingleProductData', context: context);

  @override
  Future<void> getSingleProductData() {
    return _$getSingleProductDataAsyncAction
        .run(() => super.getSingleProductData());
  }

  late final _$addItemToCartAsyncAction =
      AsyncAction('_SingleProductStore.addItemToCart', context: context);

  @override
  Future<void> addItemToCart({required BuildContext ctx}) {
    return _$addItemToCartAsyncAction.run(() => super.addItemToCart(ctx: ctx));
  }

  late final _$_SingleProductStoreActionController =
      ActionController(name: '_SingleProductStore', context: context);

  @override
  void onTapSideImage(dynamic index) {
    final _$actionInfo = _$_SingleProductStoreActionController.startAction(
        name: '_SingleProductStore.onTapSideImage');
    try {
      return super.onTapSideImage(index);
    } finally {
      _$_SingleProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInitialSelection() {
    final _$actionInfo = _$_SingleProductStoreActionController.startAction(
        name: '_SingleProductStore.setInitialSelection');
    try {
      return super.setInitialSelection();
    } finally {
      _$_SingleProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  int increaseQuantity() {
    final _$actionInfo = _$_SingleProductStoreActionController.startAction(
        name: '_SingleProductStore.increaseQuantity');
    try {
      return super.increaseQuantity();
    } finally {
      _$_SingleProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  int decreaseQuantity() {
    final _$actionInfo = _$_SingleProductStoreActionController.startAction(
        name: '_SingleProductStore.decreaseQuantity');
    try {
      return super.decreaseQuantity();
    } finally {
      _$_SingleProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDetailsTab() {
    final _$actionInfo = _$_SingleProductStoreActionController.startAction(
        name: '_SingleProductStore.changeDetailsTab');
    try {
      return super.changeDetailsTab();
    } finally {
      _$_SingleProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSelectedValue(String label, String value, String? sku) {
    final _$actionInfo = _$_SingleProductStoreActionController.startAction(
        name: '_SingleProductStore.toggleSelectedValue');
    try {
      return super.toggleSelectedValue(label, value, sku);
    } finally {
      _$_SingleProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic buyNow() {
    final _$actionInfo = _$_SingleProductStoreActionController.startAction(
        name: '_SingleProductStore.buyNow');
    try {
      return super.buyNow();
    } finally {
      _$_SingleProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
singleProductFuture: ${singleProductFuture},
createEmptyCartFuture: ${createEmptyCartFuture},
addProductToCartFuture: ${addProductToCartFuture},
selectedIndex: ${selectedIndex},
singleProductQueryResult: ${singleProductQueryResult},
createEmptyCartModelQueryResult: ${createEmptyCartModelQueryResult},
addProductsToCartModelQueryResult: ${addProductsToCartModelQueryResult},
addProductToCartModelQueryResult: ${addProductToCartModelQueryResult},
singleProductData: ${singleProductData},
createEmptyCartModel: ${createEmptyCartModel},
addProductsToCart: ${addProductsToCart},
isSelectedDetailsTab: ${isSelectedDetailsTab},
hideAppBar: ${hideAppBar},
selectedValuesByRow: ${selectedValuesByRow},
loadingString: ${loadingString},
state: ${state}
    ''';
  }
}
