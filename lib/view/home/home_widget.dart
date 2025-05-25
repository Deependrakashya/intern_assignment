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
    required bool isTablet
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: .7.h),
      height:isTablet ? 17.h :9.h,
      width: 100.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: 0.099,
          image: NetworkImage(imgUrl), // Local asset
          fit: BoxFit.cover, // Can be BoxFit.fill, contain, etc.
        ),
        borderRadius: BorderRadius.circular(18.sp),
        border: Border.all(color: const Color.fromARGB(167, 63, 63, 63)),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.textWhiteColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        color: AppColors.textWhiteColor,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 4.w),
            child: Image.asset(
              "assets/icons/tiles_icons/arrow_right.png",
              height: 2.5.h,
            ),
          ),
        ],
      ),
    );
  }
}
