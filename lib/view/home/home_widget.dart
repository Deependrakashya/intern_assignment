// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intern_project/utils/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeWidget {
  static Widget TextInputField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      decoration: BoxDecoration(
        color: Color(0xff2F2F39),
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Row(
        children: [
          Image.asset("assets/icons/home/search.png", height: 20.sp),
          SizedBox(width: 4.w),
          Expanded(
            child: TextField(
              style: TextStyle(color: AppColors.textWhiteColor),
              decoration: InputDecoration(
                hintText: '''Search “Punjabi Lyrics”''',
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  color: Color(0xff61616B),
                  fontFamily: "Syne",
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Text(
            "| ",
            style: TextStyle(
              fontSize: 22.sp,
              color: const Color.fromARGB(255, 66, 66, 66),
              fontWeight: FontWeight.normal,
            ),
          ),
          Image.asset("assets/icons/home/microPhone.png", height: 20.sp),
        ],
      ),
    );
  }

  static Widget ListTile({
    required String title,
    required String description,
    required String imgUrl,
    required String iconUrl,
    required bool isTablet,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.4.w, vertical: .7.h),
      height: isTablet ? 17.h : 9.h,
      width: 100.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: 0.099,
          image: NetworkImage(imgUrl), // Local asset
          fit: BoxFit.cover, // Can be BoxFit.fill, contain, etc.
        ),
        borderRadius: BorderRadius.circular(18.sp),
        border: Border.all(color: const Color.fromARGB(167, 49, 49, 49)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(14.sp),
                  margin: EdgeInsets.all(14.sp),
                  decoration: BoxDecoration(
                    color: AppColors.appBgColor,
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  child: Image.network(iconUrl),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.textWhiteColor,
                          fontSize: 18.sp,
                          fontFamily: "Syne",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.textWhiteColor,
                          fontFamily: "Syne",

                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 4.w),
            child: Image.asset(
              "assets/icons/tiles_icons/arrow_right.png",
              height: isTablet ? 3.h : 1.5.h,
            ),
          ),
        ],
      ),
    );
  }

  static Widget TopBgUI({required bool isTablet}) {
    return Stack(
      children: [
        // bg of the top panel
        Container(
          height: isTablet ? 50.h : 40.h,
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
          left: isTablet ? -5.2.w : -7.w,
          child: Image.asset(
            "assets/images/home/circular_.png",
            width: isTablet ? 20.w : 30.w,
          ),
        ),
        Positioned(
          bottom: 0,
          right: isTablet ? -6.2.w : -10.w,
          child: Image.asset(
            "assets/images/home/piono.png",
            width: isTablet ? 20.w : 35.w,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 7.h),
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              // top bar with textInput and circular Avataar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child:
                        // Text Input UI
                        HomeWidget.TextInputField(),
                  ),
                  // avatar icon
                  Container(
                    margin: EdgeInsets.only(left: 3.5.w),
                    child: Image.asset(
                      "assets/icons/home/avatar.png",
                      height: 24.sp,
                    ),
                  ),
                ],
              ),

              // Text on Top panel
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 6.h),

                  Text(
                    "Free Demo",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Lobster',
                      color: AppColors.textWhiteColor,
                    ),
                  ),
                  Text(
                    "for custom Music Production",
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColors.textWhiteColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: isTablet ? 19.h : 17.h,
          left: isTablet ? 43.w : 37.w,
          child: Text(
            "Claim your",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textWhiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
