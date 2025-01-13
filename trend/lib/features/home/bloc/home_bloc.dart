import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend/features/home/domain/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<FetchPostsEvent>((event, emit) async {
      try {
        print('FetchPostsEvent started');
        emit(HomeLoading());
        final posts = await homeRepository.fetchAllPosts();
        print('Fetched posts: $posts');
        emit(HomeLoaded(posts: posts));
      } catch (e) {
        print('Error fetching posts: $e');
        emit(HomeError(message: e.toString()));
      }
    });
  }
}
