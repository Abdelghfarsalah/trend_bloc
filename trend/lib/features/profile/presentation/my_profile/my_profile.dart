import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend/features/profile/presentation/follow_tap/follow_tap.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

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
                backgroundImage: AssetImage('assets/images/desert.jpg'),
              ),
              SizedBox(height: 10.h),
              Text(
                'Scout Organizations',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                '@scout_team',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: const Color.fromARGB(255, 141, 141, 141),
                ),
              ),
              SizedBox(height: 7.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 25.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          '200',
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
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FollowTabs(initialTabIndex: 0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '97.5K',
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
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FollowTabs(initialTabIndex: 1),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '121',
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
                    ),
                    Column(
                      children: [
                        Text(
                          '3.25M',
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Row(
                  children: [
                    Container(
                      height: 30.h,
                      width: 35.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.r),
                          bottomLeft: Radius.circular(5.r),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset('assets/icons/edit.svg'),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Container(
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F1F1),
                        ),
                        child: Center(
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Container(
                      height: 30.h,
                      width: 35.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5.r),
                          bottomRight: Radius.circular(5.r),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset('assets/icons/settings.svg'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  'Scouting is the main resource for millions of young people around the world. The Scout Movement is a voluntary, non-political educational movement for young people. Scouting is open to',
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
