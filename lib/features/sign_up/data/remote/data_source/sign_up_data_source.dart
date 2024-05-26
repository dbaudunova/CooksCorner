import 'package:dio/dio.dart';

abstract class SignUpDataSource {
  Future<void> registerUser(String email, String fullName, String password);
}

class SignUpDataSourceImpl extends SignUpDataSource {
  @override
  Future<void> registerUser(String email, String fullName,
      String password) async {
    try {
      final data = {'email': email, 'fullName': fullName, 'password': password};
      const url = 'http://164.92.130.84:9090/api/v1/auth/register';
      final response = await Dio().post(url, data: data);
      if (response.statusCode != 200) {
        throw Exception('Failed to register');
      }
    } on DioException catch (e) {
      throw Exception('Registration failed: ${e.message}');
    }
  }
}