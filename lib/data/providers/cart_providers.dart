import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shopp_app_mobx/constants/query_strings.dart';
import 'package:shopp_app_mobx/data/models/cart_model.dart';
import 'package:shopp_app_mobx/data/models/create_empty_cart_model.dart';
import 'package:shopp_app_mobx/data/repositories/cart_repositories.dart';

class CartProviders implements CartRepository {
  @override
  Future<QueryResult<CreateEmptyCartModel>?> sendRequestForEmptyCartId(
      GraphQLClient client) async {
    try {
      QueryResult<CreateEmptyCartModel>? productData =
          await client.mutate(MutationOptions(
        onError: (e) {
          log(e.toString());
        },
        document: gql(createEmptyCartQueryString),
      ));

      return productData;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<QueryResult<Object>?> sendRequestForCustomerCartId(
      GraphQLClient client) async {
    QueryResult<Object>? cartId = await client.mutate(MutationOptions(
      onError: (e) {
        log(e.toString());
      },
      document: gql(createCustomerCartQueryString),
    ));
    log(cartId.toString());
    return cartId;
  }

  @override
  Future<QueryResult<CartModel>?> getCartItems(GraphQLClient client) async {
    try {
      QueryResult<CartModel>? cartData = await client.query(
        QueryOptions(
            document: gql(allCartsQueryString),
            variables: const {"cart_id": "2f5kqX6v7eeCxxRnUGfkHImiTQGt8IQV"}),
      );
      log(cartData.toString());
      return cartData;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
