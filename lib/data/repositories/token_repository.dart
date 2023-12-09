abstract class TokenRepository {
  Future<void> saveToken(
      {required String token, required DateTime expirationDateTime});
  Future<String> getToken();
}
