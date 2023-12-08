import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopp_app_mobx/data/models/token_model.dart';
import 'package:shopp_app_mobx/data/repositories/token_repository.dart';

class TokenProvider implements TokenRepository {
  @override
  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokenJson = prefs.getString('token');
    if (tokenJson != null) {
      final Map<String, dynamic> tokenModelMap =
          jsonDecode(tokenJson) as Map<String, dynamic>;
      TokenModel tokenModel = TokenModel.fromMap(tokenModelMap);
      if (tokenModel.expirationDateTime.isBefore(DateTime.now())) {
        return 'TOKEN_EXPIRED';
      } else {
        return tokenModel.token;
      }
    } else {
      return 'TOKEN_IS_NOT_FOUND';
    }
  }

  @override
  Future<void> saveToken(
      {required String token, required DateTime expirationDateTime}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    TokenModel tokenModel =
        TokenModel(expirationDateTime: expirationDateTime, token: token);
    String tokenModelJson = json.encode(tokenModel.toMap());

    await prefs.setString('token', tokenModelJson);
  }
}
