import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shopp_app_mobx/data/models/cart_model.dart';
import 'package:shopp_app_mobx/data/models/create_empty_cart_model.dart';

abstract class CartRepository {
  Future<QueryResult<CreateEmptyCartModel>?> sendRequestForEmptyCartId(
      GraphQLClient client);
  Future<QueryResult<Object>?> sendRequestForCustomerCartId(
      GraphQLClient client);
  Future<QueryResult<CartModel>?> getCartItems(GraphQLClient client);
}
