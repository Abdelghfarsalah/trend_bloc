import 'package:dio/dio.dart';

class ApiAuthentication {
  final Dio _dio;

  ApiAuthentication({String baseUrl = 'http://127.0.0.1:8000/auth'})
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          headers: {'Content-Type': 'application/json'},
        ));
  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await _dio.post(
        '/login/',
        data: {'username': username, 'password': password},
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        print('Login Response Data: ${response.data}');
        return response.data;
      } else {
        throw Exception(
            'Failed to login with status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
            'API Error: ${e.response?.data['message'] ?? e.response?.statusMessage}');
      } else {
        throw Exception('Network Error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected Error: $e');
    }
  }
}
