import 'package:dio/dio.dart';
import 'package:trend/features/authentication/data/api_endpoints.dart';

class HomeRepository {
  final Dio dio;

  HomeRepository({required this.dio});

  Future<List<Map<String, dynamic>>> fetchAllPosts(
      {String? nextPageUrl}) async {
    try {
      final response = await dio.get(nextPageUrl ?? ApiEndpoints.allPosts);
      final data = response.data['results'];
      return List<Map<String, dynamic>>.from(data);
    } catch (e) {
      throw Exception('Failed to fetch posts: $e');
    }
  }
}
