import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend/features/posts/data/models/post_model.dart';
import 'package:trend/features/posts/presentation/widgets/comment_sheet.dart';

class ActivitiesPost extends StatefulWidget {
  final Post post;
  ActivitiesPost({super.key, required this.post});

  @override
  _ActivitiesPostState createState() => _ActivitiesPostState();
}

class _ActivitiesPostState extends State<ActivitiesPost> {
  bool isLiked = false; // Initial state for the like button

  void toggleLike() {
    setState(() {
      isLiked = !isLiked; // Toggle the like state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Like Button
            GestureDetector(
              onTap: toggleLike,
              child: Row(
                children: [
                  SvgPicture.asset(
                    isLiked
                        ? 'assets/icons/like_fill.svg' // Filled like icon
                        : 'assets/icons/like.svg', // Regular like icon
                    height: 12.h,
                    color: isLiked
                        ? Colors.red
                        : null, // Set color to red if liked
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    'like',
                    style: TextStyle(
                      fontSize: 12.5.sp,
                      // color: isLiked ? Colors.red : Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            // Comment Button
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/comment.svg',
                  height: 12.h,
                ),
                SizedBox(width: 4.w),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: const CommentSheet(),
                        );
                      },
                    );
                  },
                  child: Text(
                    'comment',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            // Share Button
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/share.svg',
                  height: 12.h,
                ),
                SizedBox(width: 4.w),
                Text(
                  'share',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 7.h,
        ),
      ],
    );
  }
}
