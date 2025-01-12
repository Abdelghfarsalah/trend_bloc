import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExplorePosts extends StatelessWidget {
  const ExplorePosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero, // Ensure no extra padding is applied
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of images per row
          crossAxisSpacing: 1.w, // Horizontal spacing
          mainAxisSpacing: 1.h, // Vertical spacing
          childAspectRatio: 1, // Ensures square cells
        ),
        itemCount: 30,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius:
                BorderRadius.circular(0), // Optional: Add rounded corners
            child: Image.asset(
              'assets/images/field.jpg',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
