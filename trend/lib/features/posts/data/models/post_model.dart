class Post {
  final int? id;
  final String? author;
  final int? authorId;
  final String? avatar;
  final String? description;
  final String? image;
  final bool? isLiked;
  final String? createdAt;
  final String? updatedAt;
  final int? likesCount;
  final int? commentsCount;
  final int? sharesCount;
  final int? viewsCount;
  final bool? isPublic;
  final bool? allowComments;
  final List<dynamic>? taggedUsers;
  final List<dynamic>? hashtagsData;
  final List<dynamic>? comments;

  Post({
    this.id,
    this.author,
    this.authorId,
    this.avatar,
    this.description,
    this.image,
    this.isLiked,
    this.createdAt,
    this.updatedAt,
    this.likesCount,
    this.commentsCount,
    this.sharesCount,
    this.viewsCount,
    this.isPublic,
    this.allowComments,
    this.taggedUsers,
    this.hashtagsData,
    this.comments,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int?,
      author: json['author'] as String?,
      authorId: json['author_id'] as int?,
      avatar: json['avatar'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      isLiked: json['is_liked'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      likesCount: json['likes_count'] as int?,
      commentsCount: json['comments_count'] as int?,
      sharesCount: json['shares_count'] as int?,
      viewsCount: json['views_count'] as int?,
      isPublic: json['is_public'] as bool?,
      allowComments: json['allow_comments'] as bool?,
      taggedUsers: json['tagged_users'] as List<dynamic>?,
      hashtagsData: json['hashtags_data'] as List<dynamic>?,
      comments: json['comments'] as List<dynamic>?,
    );
  }
}
