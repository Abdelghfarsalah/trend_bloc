class User {
  final String id;
  final String username;
  final String email;
  final String? fullName;
  final String? avatar;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.fullName,
    this.avatar,
  });
}
