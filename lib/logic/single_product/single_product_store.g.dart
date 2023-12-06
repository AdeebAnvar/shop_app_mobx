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

  late final _$quantityAtom =
      Atom(name: '_SingleProductStore.quantity', context: context);

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  late final _$getSingleProductDataAsyncAction =
      AsyncAction('_SingleProductStore.getSingleProductData', context: context);

  @override
  Future<dynamic> getSingleProductData() {
    return _$getSingleProductDataAsyncAction
        .run(() => super.getSingleProductData());
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
  void toggleSelectedValue(String label, String value) {
    final _$actionInfo = _$_SingleProductStoreActionController.startAction(
        name: '_SingleProductStore.toggleSelectedValue');
    try {
      return super.toggleSelectedValue(label, value);
    } finally {
      _$_SingleProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
singleProductFuture: ${singleProductFuture},
selectedIndex: ${selectedIndex},
singleProductQueryResult: ${singleProductQueryResult},
singleProductData: ${singleProductData},
isSelectedDetailsTab: ${isSelectedDetailsTab},
selectedValuesByRow: ${selectedValuesByRow},
quantity: ${quantity},
state: ${state}
    ''';
  }
}
