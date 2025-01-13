import 'package:meta/meta.dart';

@immutable
sealed class PostEvent {}

class FetchPosts extends PostEvent {}
