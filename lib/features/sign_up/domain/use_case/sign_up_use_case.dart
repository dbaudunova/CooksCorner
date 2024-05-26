import 'package:cooks_corner/features/sign_up/domain/repository/sign_up_repository.dart';

class SignUpUseCase {
final SignUpRepository repository;

  SignUpUseCase(this.repository);

  Future<void> call(String email, String fullName, String password) async {
    return await repository.registerUser(email, fullName, password);
  }
}