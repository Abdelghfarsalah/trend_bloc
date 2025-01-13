// domain/repositories/post_repository.dart
import 'package:trend/features/posts/data/models/post_model.dart';

abstract class PostRepository {
  Future<List<Post>> fetchPosts();
}
