import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend/features/authentication/bloc/authentication_bloc.dart';
import 'package:trend/features/authentication/bloc/authentication_event.dart';
import 'package:trend/features/authentication/domain/repositories/auth_repository.dart';
import 'package:trend/features/explore/bloc/explore_bloc.dart';
import 'package:trend/features/explore/data/explore_api.dart';
import 'package:trend/features/home/bloc/home_bloc.dart';
import 'package:trend/features/home/domain/repository/home_repository.dart';

final dio = Dio();

class AppBlocProviders {
  static MultiBlocProvider getBlocProviders({required Widget child}) {
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
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
            homeRepository: HomeRepository(dio: dio),
          )..add(FetchPostsEvent()),
        ),
      ],
      child: child,
    );
  }
}
