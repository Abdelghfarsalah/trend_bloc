import 'package:dio/dio.dart';
import 'package:trend/features/authentication/data/api_endpoints.dart';

class ExploreApi {
  final Dio dio;

  ExploreApi({required this.dio});

  // Fetch all posts
  Future<Map<String, dynamic>> fetchAllPosts({String? nextPageUrl}) async {
    try {
      final response = await dio.get(nextPageUrl ?? ApiEndpoints.allPosts);
      final data = response.data;

      return {
        'next': data['next'], // URL for the next page
        'results': (data['results'] as List)
            .map((post) => Map<String, dynamic>.from(post))
            .toList(), // Convert each post to Map<String, dynamic>
      };
    } catch (e) {
      throw Exception('Failed to fetch posts: $e');
    }
  }
}
