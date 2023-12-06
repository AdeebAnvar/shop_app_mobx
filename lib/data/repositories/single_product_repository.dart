import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shopp_app_mobx/data/models/single_produc_model.dart';

abstract class SingleProductRepository {
  Future<QueryResult<SingleProductModel>?> getSingleProduct(
    GraphQLClient client,
  );
}
