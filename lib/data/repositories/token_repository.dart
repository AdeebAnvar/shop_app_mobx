import 'package:shopp_app_mobx/data/models/token_model.dart';

abstract class TokenRepository {
  Future<void> saveToken(
      {required String token, required DateTime expirationDateTime});
  Future<String> getToken();
}
