import 'package:trend/features/authentication/data/api_endpoints.dart';
import 'package:trend/features/authentication/domain/entities/user.dart';
import 'package:dio/dio.dart';

class AuthenticationApi {
  final Dio dio;

  AuthenticationApi({required this.dio});

  Future<User> login(String username, String password) async {
    try {
      final response = await dio.post(
        ApiEndpoints.login,
        data: {'username': username, 'password': password},
      );

      final data = response.data['user_info'];

      return User(
        id: data['id'].toString(),
        username: data['username'],
        email: data['email'],
        fullName: data['full_name'],
        avatar: data['avatar'],
      );
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  Future<String> register({
    required String username,
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    try {
      final response = await dio.post(
        ApiEndpoints.register,
        data: {
          'username': username,
          'email': email,
          'password': password,
          'password_confirm': passwordConfirm,
        },
      );

      // Check for a success message in the response
      return response
          .data['message']; // Example: "User registered successfully."
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }

  Future<String> resetPassword(String email) async {
    try {
      final response = await dio.post(
        ApiEndpoints.resetPassword,
        data: {'email': email},
      );
      return response.data['message'];
    } catch (e) {
      throw Exception('Failed to reset password: $e');
    }
  }
}
