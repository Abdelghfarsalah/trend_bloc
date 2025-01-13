import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend/features/explore/data/explore_api.dart';
import 'explore_event.dart';
import 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final ExploreApi exploreApi;

  ExploreBloc({required this.exploreApi}) : super(ExploreInitial()) {
    on<FetchExplorePostsEvent>(_onFetchExplorePosts);
  }

  Future<void> _onFetchExplorePosts(
      FetchExplorePostsEvent event, Emitter<ExploreState> emit) async {
    try {
      emit(ExploreLoading());
      final response =
          await exploreApi.fetchAllPosts(nextPageUrl: event.nextPageUrl);

      emit(ExploreLoaded(
        posts: response['results'],
        nextPageUrl: response['next'],
      ));
    } catch (e) {
      emit(ExploreError(message: e.toString()));
    }
  }
}
