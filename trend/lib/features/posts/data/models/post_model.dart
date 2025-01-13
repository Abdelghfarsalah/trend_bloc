// class Post {
//   final int id;
//   final String author;
//   final int authorId;
//   final String avatar;
//   final String description;
//   final String image;
//   final bool isLiked;
//   final String createdAt;
//   final String updatedAt;
//   final int likesCount;
//   final int commentsCount;
//   final int sharesCount;
//   final int viewsCount;
//   final bool isPublic;
//   final bool allowComments;
//   final List<dynamic> taggedUsers;
//   final List<dynamic> hashtagsData;
//   final List<dynamic> comments;

//   Post({
//     required this.id,
//     required this.author,
//     required this.authorId,
//     required this.avatar,
//     required this.description,
//     required this.image,
//     required this.isLiked,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.likesCount,
//     required this.commentsCount,
//     required this.sharesCount,
//     required this.viewsCount,
//     required this.isPublic,
//     required this.allowComments,
//     required this.taggedUsers,
//     required this.hashtagsData,
//     required this.comments,
//   });

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       author: json['author'],
//       authorId: json['author_id'],
//       avatar: json['avatar'],
//       description: json['description'],
//       image: json['image'],
//       isLiked: json['is_liked'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//       likesCount: json['likes_count'],
//       commentsCount: json['comments_count'],
//       sharesCount: json['shares_count'],
//       viewsCount: json['views_count'],
//       isPublic: json['is_public'],
//       allowComments: json['allow_comments'],
//       taggedUsers: json['tagged_users'],
//       hashtagsData: json['hashtags_data'],
//       comments: json['comments'],
//     );
//   }
// }

class Post {
  final int id;
  final String author;
  final String avatar;
  final String description;
  final String image;

  Post({
    required this.id,
    required this.author,
    required this.avatar,
    required this.description,
    required this.image,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      author: json['author'],
      avatar: json['avatar'],
      description: json['description'],
      image: json['image'],
    );
  }
}
