// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginScreenStore on _LoginScreenStore, Store {
  late final _$loginFutureAtom =
      Atom(name: '_LoginScreenStore.loginFuture', context: context);

  @override
  ObservableFuture<graphql.QueryResult<Object?>?>? get loginFuture {
    _$loginFutureAtom.reportRead();
    return super.loginFuture;
  }

  @override
  set loginFuture(ObservableFuture<graphql.QueryResult<Object?>?>? value) {
    _$loginFutureAtom.reportWrite(value, super.loginFuture, () {
      super.loginFuture = value;
    });
  }

  late final _$cartFutureAtom =
      Atom(name: '_LoginScreenStore.cartFuture', context: context);

  @override
  ObservableFuture<graphql.QueryResult<Object?>?>? get cartFuture {
    _$cartFutureAtom.reportRead();
    return super.cartFuture;
  }

  @override
  set cartFuture(ObservableFuture<graphql.QueryResult<Object?>?>? value) {
    _$cartFutureAtom.reportWrite(value, super.cartFuture, () {
      super.cartFuture = value;
    });
  }

  late final _$loginQueryResultAtom =
      Atom(name: '_LoginScreenStore.loginQueryResult', context: context);

  @override
  graphql.QueryResult<Object?>? get loginQueryResult {
    _$loginQueryResultAtom.reportRead();
    return super.loginQueryResult;
  }

  @override
  set loginQueryResult(graphql.QueryResult<Object?>? value) {
    _$loginQueryResultAtom.reportWrite(value, super.loginQueryResult, () {
      super.loginQueryResult = value;
    });
  }

  late final _$cartQueryResultAtom =
      Atom(name: '_LoginScreenStore.cartQueryResult', context: context);

  @override
  graphql.QueryResult<Object?>? get cartQueryResult {
    _$cartQueryResultAtom.reportRead();
    return super.cartQueryResult;
  }

  @override
  set cartQueryResult(graphql.QueryResult<Object?>? value) {
    _$cartQueryResultAtom.reportWrite(value, super.cartQueryResult, () {
      super.cartQueryResult = value;
    });
  }

  late final _$signInAsyncAction =
      AsyncAction('_LoginScreenStore.signIn', context: context);

  @override
  Future<dynamic> signIn({String? email, String? password, BuildContext? ctx}) {
    return _$signInAsyncAction
        .run(() => super.signIn(email: email, password: password, ctx: ctx));
  }

  @override
  String toString() {
    return '''
loginFuture: ${loginFuture},
cartFuture: ${cartFuture},
loginQueryResult: ${loginQueryResult},
cartQueryResult: ${cartQueryResult}
    ''';
  }
}
