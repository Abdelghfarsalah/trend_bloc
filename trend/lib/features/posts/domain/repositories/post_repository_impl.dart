import 'package:dio/dio.dart';
import 'package:trend/features/posts/data/models/post_model.dart';
import 'package:trend/features/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final Dio dio;

  PostRepositoryImpl(this.dio);

  @override
  Future<List<Post>> fetchPosts() async {
    try {
      final response = await dio.get('http://167.71.92.176/posts/all-posts/');

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final results = data['results'] as List<dynamic>; // Extract `results`
        return results.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch posts');
      }
    } catch (e) {
      throw Exception('Error fetching posts: $e');
    }
  }
}
