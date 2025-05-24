import 'package:flutter/material.dart';
import 'package:intern_project/core/app_contants.dart';
import 'package:intern_project/view/home/home_screen.dart';
import 'package:sizer/sizer.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  int selectedIndex = 0;
  final List<String> _labels = ['Home', 'News', 'TrackBox', 'Projects'];
  final List<String> _icons = [
    "assets/icons/bottomNavIcons/home.png",
    "assets/icons/bottomNavIcons/news.png",
    "assets/icons/bottomNavIcons/trackBox.png",
    "assets/icons/bottomNavIcons/projects.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
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
                    height: 1.1.h,

                    width: isSelected ? 5.5.w : 0,
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
