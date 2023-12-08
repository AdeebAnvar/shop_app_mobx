import 'dart:developer';

import 'package:graphql/src/core/query_result.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shopp_app_mobx/data/repositories/login_repository.dart';

class LoginProvider implements LoginRepository {
  @override
  Future<QueryResult<Object?>?> signInUser({
    required String email,
    required String password,
    GraphQLClient? client,
  }) async {
    try {
      QueryResult<Object?> userData = await client!.mutate(
        MutationOptions(
            document: gql(
                """mutation SignInWithEmail(\$email:String!, \$password: String!){
      generateCustomerToken(email: \$email,password: \$password) {
        token
      }
    }"""),
            variables: {"email": email, "password": password}),
      );
      log(userData.toString());
      return userData;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
