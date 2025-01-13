import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/features/posts/presentation/activities_post.dart';
import 'package:trend/features/posts/presentation/body_post.dart';
import 'package:trend/features/posts/presentation/header_post.dart';

class MainPost extends StatelessWidget {
  const MainPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const HeaderPost(post: post),
        BodyPost(),
        SizedBox(
          height: 10.sp,
        ),
        const ActivitiesPost(),
        // const HeaderPost(),
        const BodyPost(),
      ],
    );
  }
}
