import 'package:dio/dio.dart';
import 'package:trend/features/profile/data/profile_model.dart';

class ProfileService {
  final Dio dio;

  ProfileService(this.dio);

  Future<ProfileModel> getProfile(int id) async {
    final response = await dio.get('http://167.71.92.176/profile/$id');
    return ProfileModel.fromJson(response.data);
  }
}
