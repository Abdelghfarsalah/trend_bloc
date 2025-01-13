import 'package:flutter/material.dart';
import 'package:trend/features/posts/data/models/post_model.dart';
import 'package:trend/features/posts/presentation/activities_post.dart';
import 'package:trend/features/posts/presentation/body_post.dart';
import 'package:trend/features/posts/presentation/header_post.dart';

class MainPost extends StatelessWidget {
  final Post post;
  MainPost({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderPost(post: post),
        BodyPost(post: post),
        SizedBox(height: 10),
        ActivitiesPost(post: post),
      ],
    );
  }
}
