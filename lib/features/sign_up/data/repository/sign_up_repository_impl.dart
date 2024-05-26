import 'package:cooks_corner/features/sign_up/data/remote/data_source/sign_up_data_source.dart';
import 'package:cooks_corner/features/sign_up/domain/repository/sign_up_repository.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDataSource dataSource;

  SignUpRepositoryImpl(this.dataSource);

  @override
  Future<void> registerUser(String email, String fullName, String password) async {
    return await dataSource.registerUser(email, fullName, password);
  }
}