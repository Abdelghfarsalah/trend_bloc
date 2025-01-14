import 'package:shared_preferences/shared_preferences.dart';
import 'package:trend/utils/currentUser.dart';

class SharedPreferencesDemo {
  Future<void> saveUserData({
    required String id,
    required String username,
    required String email,
    required String fullName,
    required String avatar,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('id', id);
    await prefs.setString('username', username);
    await prefs.setString('email', email);
    await prefs.setString('fullName', fullName);
    await prefs.setString('avatar', avatar);
  }

  static Future<currentUser> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return currentUser.fromMap({
      'id': prefs.getString('id') ?? 0,
      'username': prefs.getString('username') ?? 'username',
      'email': prefs.getString('email') ?? 'email',
      'fullName': prefs.getString('fullName') ?? '',
      'avatar': prefs.getString('avatar') ??
          "/media/profile_images/default_image.jpg",
    });
  }

  Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('id');
    await prefs.remove('username');
    await prefs.remove('email');
    await prefs.remove('fullName');
    await prefs.remove('avatar');
  }
}
