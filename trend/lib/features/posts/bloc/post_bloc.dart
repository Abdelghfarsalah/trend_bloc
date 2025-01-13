import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend/features/posts/bloc/post_event.dart';
import 'package:trend/features/posts/bloc/post_state.dart';
import 'package:trend/features/posts/domain/use_cases/get_posts.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPosts getPosts;

  PostBloc(this.getPosts) : super(PostInitial()) {
    on<FetchPosts>(_onFetchPosts);
  }

  Future<void> _onFetchPosts(FetchPosts event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final posts = await getPosts.execute();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError('Failed to fetch posts: $e'));
    }
  }
}
