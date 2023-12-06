import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shopp_app_mobx/constants/query_strings.dart';
import 'package:shopp_app_mobx/data/models/add_to_cart_model.dart';
import 'package:shopp_app_mobx/data/models/create_empty_cart_model.dart';
import 'package:shopp_app_mobx/data/models/single_produc_model.dart';
import 'package:shopp_app_mobx/data/repositories/single_product_repository.dart';

class SingleProductProvider implements SingleProductRepository {
  @override
  Future<QueryResult<SingleProductModel>?> getSingleProduct(
    GraphQLClient client,
  ) async {
    try {
      log('getSingle Product $readSingleProducts');
      QueryResult<SingleProductModel>? productData =
          await client.query(QueryOptions(
        onError: (e) {
          log(e.toString());
        },
        document: gql(readSingleProducts),
        variables: const {
          "filter": {
            "url_key": {"eq": "leah-yoga-top"}
          },
          "pageSize": 20,
          "page": 1
        },
        // variables: const {
        //   "filter": {
        //     "url_key": {
        //       "in": ["minerva-lumatech-trade-v-tee", "leah-yoga-top"]
        //     }
        //   },
        //   "pageSize": 20,
        //   "page": 1
        // },
      ));
      log(productData.toString());
      return productData;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<QueryResult<AddProductsToCart>?> addToCartSingleProduct({
    required GraphQLClient client,
    required String cartId,
    int? qunatity,
    String? parentSku,
    String? sku,
  }) async {
    try {
      QueryResult<AddProductsToCart>? productData =
          await client.mutate(MutationOptions(
              onError: (e) {
                log(e.toString());
              },
              document: gql(addToCartQuery),
              variables: {
            "cartIdString": cartId,
            "cartItemsMap": [
              {
                "quantity": qunatity,
                "parent_sku": parentSku,
                "sku": sku,
              }
            ]
          }));
      log(productData.toString());
      return productData;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<QueryResult<CreateEmptyCartModel>?> sendRequestEmptyCartId(
      GraphQLClient client) async {
    try {
      QueryResult<CreateEmptyCartModel>? productData =
          await client.mutate(MutationOptions(
        onError: (e) {
          log(e.toString());
        },
        document: gql('mutation {createEmptyCart}'),
      ));
      // log(productData.toString());

      return productData;
    } catch (e) {
      return null;
    }
  }
}
