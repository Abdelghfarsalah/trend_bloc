import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SeachAndAdvertistment extends StatefulWidget {
  const SeachAndAdvertistment({super.key});

  @override
  State<SeachAndAdvertistment> createState() => _SeachAndAdvertistmentState();
}

class _SeachAndAdvertistmentState extends State<SeachAndAdvertistment> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 45.h), // Add padding for the status bar
      // Search Bar
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
          height: 33.h,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(
                color: Colors.grey[500],
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    fit: BoxFit.contain,
                    height: 10,
                    width: 10,
                  ),
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      SizedBox(height: 15.h),
      Container(
        height: 200.h,
        width: double
            .infinity, // Ensures the image takes the full width of the screen
        child: Image.asset(
          'assets/images/football.jpg',
          fit: BoxFit.cover, // Ensures the image covers the entire container
        ),
      )
    ]);
  }
}
