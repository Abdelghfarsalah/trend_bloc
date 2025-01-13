// domain/use_cases/get_posts.dart
import 'package:trend/features/posts/data/models/post_model.dart';
import 'package:trend/features/posts/domain/repositories/post_repository.dart';

class GetPosts {
  final PostRepository repository;

  GetPosts(this.repository);

  Future<List<Post>> execute() {
    return repository.fetchPosts();
  }
}
