import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shopp_app_mobx/data/models/add_to_cart_model.dart';
import 'package:shopp_app_mobx/data/models/single_produc_model.dart';

abstract class SingleProductRepository {
  Future<QueryResult<SingleProductModel>?> getSingleProduct(
      GraphQLClient client,
      {required String urlKey});

  Future<QueryResult<AddProductsToCart>?> addToCartSingleProduct({
    required GraphQLClient client,
    required String cartId,
    int? qunatity,
    String? parentSku,
    String? sku,
  });
}
