import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shopp_app_mobx/data/models/add_to_cart_model.dart';
import 'package:shopp_app_mobx/data/models/create_empty_cart_model.dart';
import 'package:shopp_app_mobx/data/models/single_produc_model.dart';

abstract class SingleProductRepository {
  Future<QueryResult<SingleProductModel>?> getSingleProduct(
      GraphQLClient client);

  Future<QueryResult<AddProductsToCart>?> addToCartSingleProduct({
    required GraphQLClient client,
    required String cartId,
    int? qunatity,
    String? parentSku,
    String? sku,
  });

  Future<QueryResult<CreateEmptyCartModel>?> sendRequestEmptyCartId(
      GraphQLClient client);
}
