class currentUser {
  final int id;
  final String username;
  final String email;
  final String fullName;
  final String avatar;

  currentUser({
    required this.id,
    required this.username,
    required this.email,
    required this.fullName,
    required this.avatar,
  });

  factory currentUser.fromMap(Map<String, dynamic> map) {
    return currentUser(
      id: int.parse(
        map['id'],
      ),
      username: map['username'],
      email: map['email'],
      fullName: map['fullName'] ?? '',
      avatar: map['avatar'] ?? "/media/profile_images/default_image.jpg",
    );
  }
}
