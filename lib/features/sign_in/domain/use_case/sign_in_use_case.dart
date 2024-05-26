import 'package:cooks_corner/features/sign_in/domain/repository/sign_in_repository.dart';

class SignInUseCase {
  final SignInRepository repository;

  SignInUseCase(this.repository);

  Future<void> call(String email, String password) async {
    return await repository.authorizeUser(email, password);
  }
}
