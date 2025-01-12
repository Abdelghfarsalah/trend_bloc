import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/features/home/activities_post.dart';
import 'package:trend/features/home/body_post.dart';
import 'package:trend/features/home/header_post.dart';

class MainPost extends StatelessWidget {
  const MainPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderPost(),
        BodyPost(),
        SizedBox(
          height: 10.sp,
        ),
        const ActivitiesPost(),
        const HeaderPost(),
        const BodyPost(),
      ],
    );
  }
}
