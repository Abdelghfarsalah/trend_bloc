import 'package:flutter/material.dart';
import 'package:trend/features/posts/data/models/post_model.dart';

class BodyPost extends StatelessWidget {
  final Post post;

  const BodyPost({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        image: post.image != null &&
                post.image!.isNotEmpty // Check if not null and not empty
            ? DecorationImage(
                image: NetworkImage(post.image!), // Image from API
                fit: BoxFit.cover,
              )
            : const DecorationImage(
                image: AssetImage(
                    'assets/images/placeholder.jpg'), // Fallback image
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
