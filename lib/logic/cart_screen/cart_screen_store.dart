import 'package:graphql_flutter/graphql_flutter.dart' as graphql;
import 'package:mobx/mobx.dart' as mobx;
import 'package:mobx/mobx.dart';
import 'package:shopp_app_mobx/constants/enums.dart';
import 'package:shopp_app_mobx/data/models/cart_model.dart';
import 'package:shopp_app_mobx/data/providers/cart_providers.dart';
import 'package:shopp_app_mobx/data/repositories/cart_repositories.dart';
part 'cart_screen_store.g.dart';

class CartScreenStore extends _CartScreenStore with _$CartScreenStore {
  CartScreenStore(graphql.GraphQLClient client) : super(client);
}

abstract class _CartScreenStore with mobx.Store {
  final graphql.GraphQLClient client;

  _CartScreenStore(this.client);

  final CartRepository cartRepository = CartProviders();

  @observable
  ObservableFuture<graphql.QueryResult<CartModel>?>? cartFuture;

  @observable
  graphql.QueryResult<CartModel>? cartQueryResult;

  @observable
  CartModel? cartModel;

  @computed
  StoreState get state {
    if (cartFuture?.status == FutureStatus.rejected) {
      return StoreState.initial;
    }

    return cartFuture?.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @observable
  Future<void> getCartItems() async {
    cartFuture = ObservableFuture(cartRepository.getCartItems(client));
    cartQueryResult = await cartFuture;
    cartModel = CartModel.fromJson(cartQueryResult!.data!);
  }
}
