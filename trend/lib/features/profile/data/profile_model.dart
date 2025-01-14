class ProfileModel {
  final int id;
  final String user;
  final String fullName;
  final String bio;
  final String avatar;
  final int totalLikes;
  final int followers;
  final int following;

  ProfileModel({
    required this.id,
    required this.user,
    required this.fullName,
    required this.bio,
    required this.avatar,
    required this.totalLikes,
    required this.followers,
    required this.following,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      user: json['user'],
      fullName: json['full_name'],
      bio: json['bio'],
      avatar: json['avatar'],
      totalLikes: json['total_likes'],
      followers: json['followers'],
      following: json['following'],
    );
  }
}
