import 'package:dio/dio.dart';

abstract class SignInDataSource {
  Future<void> authorizeUser(String email, String password);
}

class SignInDataSourceImpl extends SignInDataSource {
  @override
  Future<void> authorizeUser(String email,
      String password) async {
    try {
      final data = {'email': email, 'password': password};
      const url = 'http://164.92.130.84:9090/api/v1/auth/authenticate';
      final response = await Dio().post(url, data: data);
      if (response.statusCode != 200) {
        throw Exception('Failed to sign in');
      }
    } on DioException catch (e) {
      throw Exception('Authorization failed: ${e.message}');
    }
  }
}