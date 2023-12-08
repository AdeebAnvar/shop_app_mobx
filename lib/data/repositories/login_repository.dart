import 'package:graphql_flutter/graphql_flutter.dart';

abstract class LoginRepository {
  Future<QueryResult?> signInUser(
      {required String email, required String password, GraphQLClient client});
}
