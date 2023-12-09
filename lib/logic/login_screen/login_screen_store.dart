// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:jwt_decode/jwt_decode.dart';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as graphql;
import 'package:mobx/mobx.dart' as mobx;
import 'package:mobx/mobx.dart';
import 'package:shopp_app_mobx/data/providers/cart_providers.dart';
import 'package:shopp_app_mobx/data/providers/login_provider.dart';
import 'package:shopp_app_mobx/data/providers/token_provider.dart';
import 'package:shopp_app_mobx/data/repositories/cart_repositories.dart';
import 'package:shopp_app_mobx/data/repositories/login_repository.dart';
import 'package:shopp_app_mobx/data/repositories/token_repository.dart';
import 'package:shopp_app_mobx/widgets/loading_dialogue.dart';
part 'login_screen_store.g.dart';

class LoginScreenStore extends _LoginScreenStore with _$LoginScreenStore {
  LoginScreenStore(graphql.GraphQLClient client) : super(client);
}

abstract class _LoginScreenStore with mobx.Store {
  final graphql.GraphQLClient client;

  _LoginScreenStore(this.client);
  LoginRepository loginRepository = LoginProvider();
  TokenRepository tokenRepository = TokenProvider();
  CartRepository cartRepository = CartProviders();

  @mobx.observable
  mobx.ObservableFuture<graphql.QueryResult<Object?>?>? loginFuture;
  @mobx.observable
  mobx.ObservableFuture<graphql.QueryResult<Object?>?>? cartFuture;

  @mobx.observable
  graphql.QueryResult<Object?>? loginQueryResult;
  @mobx.observable
  graphql.QueryResult<Object?>? cartQueryResult;

  @mobx.action
  Future signIn({String? email, String? password, BuildContext? ctx}) async {
    try {
      String em = email!;
      String pass = password!;
      LoadingDialogue().showCupertinoLoadingDialogue(
          ctx: ctx!, loadingString: 'Checking User');
      loginFuture = mobx.ObservableFuture(loginRepository.signInUser(
          email: em.toString(), password: pass.toString(), client: client));
      loginQueryResult = await loginFuture;
      log('emial : $email');
      log('pass : $password');
      String? token =
          loginQueryResult?.data?['generateCustomerToken']['token'].toString();
      Map<String, dynamic>? decodedToken = Jwt.parseJwt(token!);
      DateTime? expirationDate = decodedToken['exp'] != null
          ? DateTime.fromMillisecondsSinceEpoch(decodedToken['exp'] * 1000)
          : null;

      if (expirationDate != null) {
        tokenRepository.saveToken(
            token: token, expirationDateTime: expirationDate);
      }
      String? t = await tokenRepository.getToken();
      log('from store $t');
      cartFuture = mobx.ObservableFuture(
        cartRepository.sendRequestForCustomerCartId(client),
      );
      cartQueryResult = await cartFuture;

      if (cartQueryResult != null && cartQueryResult?.data != null) {
        log('sku : ${cartQueryResult!.data!['customerCart']["id"]}');
      }
    } finally {
      Navigator.pop(ctx!);
    }
  }
}
