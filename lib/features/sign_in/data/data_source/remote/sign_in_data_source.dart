abstract class SignInDataSource {
  Future<void> authorizeUser(String email, String password);
}

class SignInDataSourceImpl extends SignInDataSource {
  @override
  Future<void> authorizeUser(String email, String password) {
    // TODO: implement authorizeUser
    throw UnimplementedError();
  }
}