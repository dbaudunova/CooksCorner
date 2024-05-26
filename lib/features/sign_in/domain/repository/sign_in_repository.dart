abstract class SignInRepository {
  Future<void> authorizeUser(String email, String password);
}