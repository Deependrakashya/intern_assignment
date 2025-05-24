import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intern_project/core/app_contants.dart';
import 'package:intern_project/repo/firestore_services.dart';
import 'package:intern_project/view/home/home_widget.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // bg of the top panel
                Container(
                  width: double.infinity,
                  height: 40.h, // Adjust height as needed
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFa90140), Color(0xFF610024)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.h,
                  left: -7.w,
                  child: Container(
                    height: 15.h,
                    child: Image.asset("assets/images/home/circular_.png"),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: -10.w,
                  child: Container(
                    height: 15.h,

                    child: Image.asset("assets/images/home/piono.png"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 7.h),
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: HomeWidget.TextInputField()),
                          Container(
                            margin: EdgeInsets.only(left: 3.5.w),
                            child: Image.asset(
                              "assets/icons/home/avatar.png",
                              height: 24.sp,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 6.h),

                          Text(
                            "Free Demo",
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Lobster',
                              color: AppContants.textWhiteColor,
                            ),
                          ),
                          Text(
                            "for custom Music Production",
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: AppContants.textWhiteColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 17.h,
                  left: 37.w,
                  child: Text(
                    "Claim your",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppContants.textWhiteColor,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 3.h),
              child: Text(
                "Hire hand-picked Pros for popular music services",
                style: TextStyle(color: AppContants.textWhiteColor),
              ),
            ),
            HomeWidget.ListTile(
              title: "Music Production",
              description: "Custom instrumentals & film scoring",
              imgUrl: "assets/tilesBgImage/lyrics_writting.png",
            ),
            HomeWidget.ListTile(
              title: "Music Production",
              description: "Custom instrumentals & film scoring",
              imgUrl: "assets/tilesBgImage/lyrics_writting.png",
            ),
            HomeWidget.ListTile(
              title: "Music Production",
              description: "Custom instrumentals & film scoring",
              imgUrl: "assets/tilesBgImage/lyrics_writting.png",
            ),
          ],
        ),
      ),
    );
  }
}
