abstract class SignUpRepository {
  Future<void> registerUser(String email, String fullName, String password);
}