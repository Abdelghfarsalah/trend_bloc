import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend/features/add_post/add_post.dart';
import 'package:trend/features/home/home_page.dart';
import 'package:trend/features/notifications/notifications.dart';
import 'package:trend/features/profile/my_profile/my_profile.dart';
import 'package:trend/features/search/search.dart';
import 'package:trend/utils/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const AddPost(),
    const Notifications(),
    const MyProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 40.h, // Fixed height
          color: Colors.white, // Background color
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround, // Space icons evenly
            children: [
              GestureDetector(
                onTap: () => _onItemTapped(0),
                child: SvgPicture.asset(
                  'assets/icons/home_icon.svg',
                  height: 20.5.h, // Icon size
                  color: _selectedIndex == 0
                      ? Color(AppColors.black)
                      : Color(AppColors.greyDark),
                ),
              ),
              GestureDetector(
                onTap: () => _onItemTapped(1),
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                  height: 20.5.h,
                  color: _selectedIndex == 1
                      ? Color(AppColors.black)
                      : Color(AppColors.greyDark),
                ),
              ),
              GestureDetector(
                onTap: () => _onItemTapped(2),
                child: SvgPicture.asset(
                  'assets/icons/plus-circle.svg',
                  height: 20.5.h,
                  color: _selectedIndex == 2
                      ? Color(AppColors.black)
                      : Color(AppColors.greyDark),
                ),
              ),
              GestureDetector(
                onTap: () => _onItemTapped(3),
                child: SvgPicture.asset(
                  'assets/icons/bell.svg',
                  height: 20.5.h,
                  color: _selectedIndex == 3
                      ? Color(AppColors.black)
                      : Color(AppColors.greyDark),
                ),
              ),
              GestureDetector(
                onTap: () => _onItemTapped(4),
                child: SvgPicture.asset(
                  'assets/icons/person.svg',
                  height: 20.5.h,
                  color: _selectedIndex == 4
                      ? Color(AppColors.black)
                      : Color(AppColors.greyDark),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
