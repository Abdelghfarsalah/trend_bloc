import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/utils/colors.dart';

class CommentSheet extends StatefulWidget {
  const CommentSheet({super.key});

  @override
  _CommentSheetState createState() => _CommentSheetState();
}

class _CommentSheetState extends State<CommentSheet> {
  // List of comments
  final List<Map<String, String>> comments = [
    {"username": "aziz", "comment": "I love this post!"},
    {
      "username": "sarah",
      "comment":
          "This is amazing! Keep up the great work. I look forward to more updates."
    },
    {"username": "john", "comment": "Nice!"},
    {
      "username": "alex",
      "comment":
          "Absolutely fantastic! Your attention to detail is impeccable. Well done!"
    },
    {"username": "maya", "comment": "Great work!"},
    {"username": "liam", "comment": "Wow, this is very inspiring!"},
    {
      "username": "emma",
      "comment":
          "I can't believe how great this looks! Truly impressive effort."
    },
    {"username": "noah", "comment": "Cool idea!"},
    {
      "username": "olivia",
      "comment":
          "Really well thought out and beautifully presented. Kudos to you!"
    },
    {
      "username": "william",
      "comment":
          "This is exceptional work. Keep pushing forward, and you'll achieve even greater things!"
    },
  ];

  final TextEditingController _controller = TextEditingController();

  void _addComment(String text) {
    if (text.isNotEmpty) {
      setState(() {
        comments.add({
          "username": "You", // Example username for the new comment
          "comment": text,
        });
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Comments header
        SizedBox(height: 40.h),
        Center(
          child: Text(
            'Comments',
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 6.h),
        Divider(
          color: Colors.grey,
          thickness: 0.1,
          height: 5.h,
        ),
        SizedBox(height: 6.h),

        // Comments list
        Expanded(
          child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage(
                          'assets/images/image.png'), // Example image
                    ),
                    SizedBox(width: 10.w),
                    // Username and Comment
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comment["username"]!,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            children: [
                              Text(
                                comment["comment"]!,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Spacer(),
                              Icon(
                                Icons.favorite_border,
                                size: 12.sp,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'Reply',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Row(
                            children: [
                              Container(
                                width: 15.w,
                                child: Expanded(
                                  child: Divider(
                                    thickness: 0.3,
                                    color: Colors.grey,
                                    height: 1,
                                  ),
                                ),
                              ),
                              Text(
                                '  View 10 replies',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                              // SizedBox(width: 8.w),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        // Thin grey line above text field
        Divider(
          color: Colors.grey,
          thickness: 0.1,
          height: 1,
        ),
        Padding(
          padding:
              EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h, top: 8.h),
          child: Row(
            children: [
              // Avatar on the left of input field
              CircleAvatar(
                radius: 15.h,
                backgroundImage: AssetImage('assets/images/image.png'),
              ),
              SizedBox(width: 10.w),

              // Input field
              Expanded(
                child: Container(
                  height: 35.h, // Reduce height to make the input compact
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                      color: const Color.fromARGB(255, 234, 234, 234),
                      width: 1.5,
                    ),
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "comment...",
                      hintStyle: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none, // Remove default borders
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.h, // Reduce vertical padding
                        horizontal: 16.w, // Add consistent horizontal padding
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 12.sp, // Match text size with compact height
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),

              // Send Button
              IconButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    _addComment(_controller.text);
                  }
                },
                icon: const Icon(Icons.send),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
