import 'package:trend/features/profile/data/profile_model.dart';
import 'package:trend/features/profile/domain/repositories/profile_repo.dart';

class ProfileRepository {
  final ProfileService service;

  ProfileRepository(this.service);

  Future<ProfileModel> fetchProfile(int id) {
    return service.getProfile(id);
  }
}
