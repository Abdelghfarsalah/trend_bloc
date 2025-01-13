class ApiEndpoints {
  static const String baseUrl = 'http://167.71.92.176';
  static const String login = '$baseUrl/auth/login/';
  static const String register = '$baseUrl/auth/register/';
  static const String changePassword = '$baseUrl/auth/change-password/';
  static const String resetPassword = '$baseUrl/auth/reset-password/';

  // explore endpoints
  static const String allPosts = '$baseUrl/posts/all-posts/';
}
