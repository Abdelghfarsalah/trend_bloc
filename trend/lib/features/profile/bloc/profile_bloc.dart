import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend/features/profile/domain/repositories/profile.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository;

  ProfileBloc(this.repository) : super(ProfileInitial()) {
    on<FetchProfileEvent>(_onFetchProfile);
  }

  Future<void> _onFetchProfile(
    FetchProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final profile = await repository.fetchProfile(event.id);
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
