import 'package:cooks_corner/features/sign_in/data/data_source/remote/sign_in_data_source.dart';
import 'package:cooks_corner/features/sign_in/domain/repository/sign_in_repository.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInDataSource dataSource;

  SignInRepositoryImpl(this.dataSource);

  @override
  Future<void> authorizeUser(String email, String password) async {
    return await dataSource.authorizeUser(email, password);
  }
}
