import 'package:flutter/material.dart';
import 'package:intern_project/utils/app_colors.dart';
import 'package:intern_project/view/home/home_screen.dart';
import 'package:intern_project/view/news/news_screen.dart';
import 'package:intern_project/view/projects/project_screen.dart';
import 'package:intern_project/view/track_box/track_box_screen.dart';
import 'package:sizer/sizer.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> screens = [
    HomeScreen(),
    NewsScreen(),
    TrackBoxScreen(),
    ProjectScreen(),
  ];
  int selectedIndex = 0;
  final List<String> _labels = ['Home', 'News', 'TrackBox', 'Projects'];
  final List<String> _icons = [
    "assets/icons/bottom_nav_icons/home.png",
    "assets/icons/bottom_nav_icons/news.png",
    "assets/icons/bottom_nav_icons/trackBox.png",
    "assets/icons/bottom_nav_icons/projects.png",
  ];

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;

    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        width: isTablet ? 600 : double.infinity,
        padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: .8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.sp),
            topRight: Radius.circular(15.sp),
          ),
          border: Border(
            top: BorderSide(
              color: const Color.fromARGB(255, 43, 42, 42),
              width: 1,
            ), // Top border only
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_icons.length, (index) {
            final isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () => setState(() => selectedIndex = index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // white dot when the selected icon tapped
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: isTablet ? 1.1.h : 0.8.h,
                    width: isSelected ? 15.sp : 0,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.sp),
                        bottomRight: Radius.circular(30.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  // nav icons and change color when pressed
                  Image.asset(
                    _icons[index],
                    color: isSelected ? Colors.white : Colors.grey,
                    height: 24,
                  ),
                  // tab label
                  SizedBox(height: 1.h),
                  Text(
                    _labels[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 1.h),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
