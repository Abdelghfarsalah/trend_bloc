import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend/features/authentication/bloc/authentication_bloc.dart';
import 'package:trend/features/authentication/bloc/authentication_event.dart';
import 'package:trend/features/authentication/domain/repositories/auth_repository.dart';
import 'package:trend/features/explore/bloc/explore_bloc.dart';
import 'package:trend/features/explore/data/explore_api.dart';
import 'package:trend/features/posts/bloc/post_bloc.dart';
import 'package:trend/features/posts/bloc/post_event.dart';
import 'package:trend/features/posts/domain/repositories/post_repository_impl.dart';
import 'package:trend/features/posts/domain/use_cases/get_posts.dart';

class AppBlocProviders {
  static MultiBlocProvider getBlocProviders({required Widget child}) {
    final dio = Dio();
    final postRepository =
        PostRepositoryImpl(dio); // Replace with actual repository
    final getPosts = GetPosts(postRepository); // Create GetPosts instance
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            final bloc =
                AuthenticationBloc(authApi: AuthenticationApi(dio: dio));
            bloc.add(AuthenticationCheckStatusEvent());
            return bloc;
          },
        ),
        BlocProvider<ExploreBloc>(
          create: (context) => ExploreBloc(
            exploreApi: ExploreApi(dio: dio),
          ),
        ),
        BlocProvider(
          create: (_) =>
              PostBloc(getPosts)..add(FetchPosts()), // Pass GetPosts instance
          // Automatically fetch posts
        ),
      ],
      child: child,
    );
  }
}
