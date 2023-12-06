import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart' as graphql;
import 'package:mobx/mobx.dart' as mobx;
import 'package:mobx/mobx.dart';
import 'package:shopp_app_mobx/constants/enums.dart';
import 'package:shopp_app_mobx/data/models/single_produc_model.dart';
import 'package:shopp_app_mobx/data/repositories/single_product_repository.dart';
part 'single_product_store.g.dart';

class SingleProductStore extends _SingleProductStore with _$SingleProductStore {
  SingleProductStore(SingleProductRepository singleProductRepository,
      graphql.GraphQLClient client)
      : super(singleProductRepository, client);
}

abstract class _SingleProductStore with mobx.Store {
  final SingleProductRepository _singleProductRepository;

  final graphql.GraphQLClient client;

  _SingleProductStore(this._singleProductRepository, this.client);

  @mobx.observable
  mobx.ObservableFuture<graphql.QueryResult<SingleProductModel>?>?
      singleProductFuture;

  @mobx.observable
  int selectedIndex = 0;

  @mobx.observable
  graphql.QueryResult<SingleProductModel>? singleProductQueryResult;

  @mobx.observable
  SingleProductModel? singleProductData;

  @mobx.observable
  bool isSelectedDetailsTab = true;

  @mobx.computed
  StoreState get state {
    if (singleProductFuture?.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return singleProductFuture?.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @mobx.action
  void onTapSideImage(index) {
    selectedIndex = index;
  }

  @mobx.observable
  mobx.ObservableMap<String, mobx.ObservableSet<String>> selectedValuesByRow =
      mobx.ObservableMap<String, mobx.ObservableSet<String>>();

  @mobx.action
  Future getSingleProductData() async {
    try {
      singleProductFuture = mobx.ObservableFuture(
        _singleProductRepository.getSingleProduct(client),
      );
      singleProductQueryResult = await singleProductFuture;

      if (singleProductQueryResult != null &&
          singleProductQueryResult?.data != null) {
        singleProductData =
            SingleProductModel.fromJson(singleProductQueryResult!.data!);
      } else {
        singleProductData = null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @observable
  int quantity = 0;

  @mobx.action
  int increaseQuantity() => quantity = quantity + 1;

  @mobx.action
  int decreaseQuantity() => quantity = quantity - 1;

  @mobx.action
  void changeDetailsTab() =>
      isSelectedDetailsTab = isSelectedDetailsTab = !isSelectedDetailsTab;

  @mobx.action
  void toggleSelectedValue(String label, String value) {
    if (!selectedValuesByRow.containsKey(label)) {
      selectedValuesByRow[label] = mobx.ObservableSet<String>();
    }

    final selectedValues = selectedValuesByRow[label]!;

    if (selectedValues.contains(value)) {
      selectedValues.remove(value);
    } else {
      // Unselect previously selected chip in the same row
      selectedValues.clear();
      selectedValues.add(value);
    }
  }
}
