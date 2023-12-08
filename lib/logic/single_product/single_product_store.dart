import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as graphql;
import 'package:mobx/mobx.dart' as mobx;
import 'package:mobx/mobx.dart';
import 'package:shopp_app_mobx/constants/enums.dart';
import 'package:shopp_app_mobx/data/models/add_to_cart_model.dart';
import 'package:shopp_app_mobx/data/models/create_empty_cart_model.dart';
import 'package:shopp_app_mobx/data/models/single_produc_model.dart';
import 'package:shopp_app_mobx/data/providers/cart_providers.dart';
import 'package:shopp_app_mobx/data/providers/single_product_provider.dart';
import 'package:shopp_app_mobx/data/repositories/cart_repositories.dart';
import 'package:shopp_app_mobx/data/repositories/single_product_repository.dart';
import 'package:shopp_app_mobx/widgets/loading_dialogue.dart';
part 'single_product_store.g.dart';

class SingleProductStore extends _SingleProductStore with _$SingleProductStore {
  SingleProductStore(graphql.GraphQLClient client) : super(client);
}

abstract class _SingleProductStore with mobx.Store {
  final graphql.GraphQLClient client;

  _SingleProductStore(this.client);

  final SingleProductRepository _singleProductRepository =
      SingleProductProvider();

  final CartRepository cartRepository = CartProviders();

  @mobx.observable
  mobx.ObservableFuture<graphql.QueryResult<SingleProductModel>?>?
      singleProductFuture;

  @mobx.observable
  mobx.ObservableFuture<graphql.QueryResult<CreateEmptyCartModel>?>?
      createEmptyCartFuture;

  @mobx.observable
  mobx.ObservableFuture<graphql.QueryResult<AddProductsToCart>?>?
      addProductToCartFuture;

  @mobx.observable
  int selectedIndex = 0;

  @mobx.observable
  graphql.QueryResult<SingleProductModel>? singleProductQueryResult;

  @mobx.observable
  graphql.QueryResult<CreateEmptyCartModel>? createEmptyCartModelQueryResult;

  @mobx.observable
  graphql.QueryResult<AddProductsToCart>? addProductsToCartModelQueryResult;

  @mobx.observable
  graphql.QueryResult<AddProductsToCart>? addProductToCartModelQueryResult;

  @mobx.observable
  SingleProductModel? singleProductData;

  @mobx.observable
  CreateEmptyCartModel? createEmptyCartModel;

  @mobx.observable
  AddProductsToCart? addProductsToCart;

  @mobx.observable
  bool isSelectedDetailsTab = true;

  @mobx.observable
  bool hideAppBar = true;

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

  String colorValue = '';

  String sizeValue = '';

  @mobx.observable
  mobx.ObservableMap<String, mobx.ObservableSet<String>> selectedValuesByRow =
      mobx.ObservableMap<String, mobx.ObservableSet<String>>();

  @mobx.action
  Future<void> getSingleProductData() async {
    try {
      singleProductFuture = mobx.ObservableFuture(
        _singleProductRepository.getSingleProduct(client),
      );

      singleProductQueryResult = await singleProductFuture;

      if (singleProductQueryResult != null &&
          singleProductQueryResult?.data != null) {
        singleProductData =
            SingleProductModel.fromJson(singleProductQueryResult!.data!);

        log('sku : ${singleProductData!.products!.items![0].sku}');

        parentSku = singleProductData!.products!.items![0].sku.toString();

        log('csku : ${singleProductData!.products!.items![0].variants![0].product!.sku}');
      } else {
        singleProductData = null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  int quantity = 1;

  @mobx.action
  int increaseQuantity() => quantity = quantity + 1;

  @mobx.action
  int decreaseQuantity() => quantity = quantity - 1;

  String parentSku = '';

  @mobx.action
  void changeDetailsTab() =>
      isSelectedDetailsTab = isSelectedDetailsTab = !isSelectedDetailsTab;

  @mobx.action
  void toggleSelectedValue(String label, String value, String? sku) {
    if (!selectedValuesByRow.containsKey(label)) {
      selectedValuesByRow[label] = mobx.ObservableSet<String>();
    }

    final selectedValues = selectedValuesByRow[label]!;

    parentSku = sku.toString();

    if (selectedValues.contains(value)) {
      selectedValues.remove(value);
    } else {
      selectedValues.clear();

      selectedValues.add(value);
    }
  }

  @mobx.observable
  String loadingString = 'Please Wait . . . ';

  @mobx.action
  Future<void> addItemToCart({required BuildContext ctx}) async {
    try {
      LoadingDialogue()
          .showCupertinoLoadingDialogue(ctx: ctx, loadingString: loadingString);

      createEmptyCartFuture = mobx.ObservableFuture(
        cartRepository.sendRequestForEmptyCartId(client),
      );

      loadingString = 'Sending request';

      createEmptyCartModelQueryResult = await createEmptyCartFuture;

      createEmptyCartModel =
          CreateEmptyCartModel.fromJson(createEmptyCartModelQueryResult!.data!);

      loadingString = 'Creating Cart';

      log(createEmptyCartModel?.createEmptyCart.toString() ??
          '$createEmptyCartModel');

      addProductToCartFuture = mobx.ObservableFuture(
          _singleProductRepository.addToCartSingleProduct(
              cartId: createEmptyCartModel!.createEmptyCart.toString(),
              client: client,
              parentSku: parentSku,
              qunatity: quantity,
              sku: '$parentSku-$sizeValue-$colorValue'));

      loadingString = 'Adding to Cart';

      addProductToCartModelQueryResult = await addProductToCartFuture;

      addProductsToCart =
          AddProductsToCart.fromJson(addProductToCartModelQueryResult!.data!);

      loadingString = 'Adding to Cart';
    } finally {
      Navigator.pop(ctx);
    }
  }

  @mobx.action
  buyNow() {}
}
