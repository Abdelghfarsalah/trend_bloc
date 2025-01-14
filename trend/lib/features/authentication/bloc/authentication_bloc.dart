import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend/features/authentication/domain/repositories/auth_repository.dart';
import 'package:trend/utils/SharedPreferencesDemo.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationApi authApi;
  SharedPreferencesDemo sharedPreferencesDemo = SharedPreferencesDemo();
  AuthenticationBloc({required this.authApi}) : super(AuthenticationInitial()) {
    // Handle login event
    on<AuthenticationLoginEvent>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        final user = await authApi.login(event.username, event.password);
        await sharedPreferencesDemo.saveUserData(
          id: user.id ?? "0",
          email: user.email ?? "null",
          username: user.username ?? "null",
          fullName: user.fullName ?? "null",
          avatar: user.avatar ?? "null",
        );
        emit(AuthenticationAuthenticated(username: user.username));
      } catch (e) {
        emit(AuthenticationError(message: e.toString()));
      }
    });

    // Handle logout event
    on<AuthenticationLogoutEvent>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        // Simulate logout
        await Future.delayed(const Duration(seconds: 1));
        emit(AuthenticationUnauthenticated());
      } catch (e) {
        emit(AuthenticationError(message: e.toString()));
      }
    });

    on<AuthenticationCheckStatusEvent>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        // Simulate dynamic authentication status
        final isAuthenticated =
            DateTime.now().second % 2 == 0; // Simulates true/false dynamically

        if (isAuthenticated) {
          emit(AuthenticationAuthenticated(username: "ExistingUser"));
        } else {
          emit(AuthenticationUnauthenticated());
        }
      } catch (e) {
        emit(AuthenticationError(message: e.toString()));
      }
    });

    // Handle registration event
    on<AuthenticationRegisterEvent>((event, emit) async {
      emit(RegistrationLoading());
      try {
        final message = await authApi.register(
          username: event.username,
          email: event.email,
          password: event.password,
          passwordConfirm: event.passwordConfirm,
        );

        emit(RegistrationSuccess(message: message));
      } catch (e) {
        emit(RegistrationError(message: e.toString()));
      }
    });

    // Handle reset password event
    on<ResetPasswordEvent>((event, emit) async {
      emit(AuthenticationLoading()); // Emit loading state
      try {
        final message = await authApi.resetPassword(event.email);
        emit(ResetPasswordSuccess(message: message)); // Emit success state
      } catch (e) {
        emit(AuthenticationError(message: e.toString())); // Emit error state
      }
    });
  }
}
