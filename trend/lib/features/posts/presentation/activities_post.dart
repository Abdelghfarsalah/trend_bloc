import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend/features/posts/data/models/post_model.dart';
import 'package:trend/features/posts/presentation/widgets/comment_sheet.dart';

class ActivitiesPost extends StatelessWidget {
  Post post;
  ActivitiesPost({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/like.svg',
                  color: Colors.grey,
                  height: 12.h,
                ),
                Text(
                  ' like',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            // Comment Button
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/comment.svg',
                  color: Colors.grey,
                  height: 12.h,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled:
                          true, // Allows the bottom sheet to adjust with the keyboard
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context)
                                .viewInsets
                                .bottom, // Adjust for keyboard
                          ),
                          child: const CommentSheet(),
                        );
                      },
                    );
                  },
                  child: Text(
                    ' comment',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
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
                  color: Colors.grey,
                  height: 12.h,
                ),
                Text(
                  ' share',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 5.h,
        )
      ],
    );
  }
}
