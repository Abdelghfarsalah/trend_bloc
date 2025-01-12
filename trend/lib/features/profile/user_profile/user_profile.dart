import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(), // Enables smooth scrolling
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 80.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 45.r,
                backgroundImage: AssetImage('assets/images/dunk.jpg'),
              ),
              SizedBox(height: 10.h),
              Text(
                'Afro Team',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                '@afro',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: const Color.fromARGB(255, 141, 141, 141),
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 25.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          '40',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Posts',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '7.3K',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Followers',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '56',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Following',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '1.2M',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Likes',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7.h),
              Row(
                children: [
                  SizedBox(width: 30.w),
                  Container(
                    width: 145.w,
                    height: 28.h,
                    child: Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                        ),
                        child: Text(
                          'Following',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 145.w,
                    height: 28.h,
                    child: Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                          side: BorderSide.none, // Remove the border
                        ),
                        child: Text(
                          'Message',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.w),
                ],
              ),
              SizedBox(height: 7.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Dive into Stunning Goals and Unforgettable Highlights.\n📍 Location: Lagos, Nigeria 🇳🇬\n📞 Phone: +234 901 234 5678',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    height: 1.5,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Wrap(
                spacing: 1.0, // Horizontal space between items
                runSpacing: 1.0, // Vertical space between rows
                children: List.generate(
                  9, // Number of photos
                  (index) => Container(
                    width: (MediaQuery.of(context).size.width - 5) / 3,
                    height: (MediaQuery.of(context).size.width - 5) /
                        3, // Keep height the same for square shape
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/person.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
