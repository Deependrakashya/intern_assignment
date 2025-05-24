import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intern_project/utils/app_colors.dart';
import 'package:intern_project/model/music_services_model.dart';
import 'package:intern_project/repo/firestore_services.dart';
import 'package:intern_project/view/home/home_widget.dart';
import 'package:intern_project/viewModel/home/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).getMusicServices();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Column(
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
                    top: 17.h,
                    left: 37.w,
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
              ),
              Container(
                margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                child: Text(
                  "Hire hand-picked Pros for popular music services",
                  style: TextStyle(color: AppColors.textWhiteColor),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount:
                      provider.isLoading ? 4 : provider.musicServices.length,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var musicServices = provider.musicServices;
                    return provider.isLoading
                        ? Skeletonizer(
                          effect: ShimmerEffect(
                            // customize shimmer style
                            baseColor: Colors.grey.shade300,
                            highlightColor: const Color.fromARGB(
                              255,
                              31,
                              25,
                              25,
                            ),
                            duration: Duration(seconds: 1),
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Card(
                              color: const Color.fromARGB(255, 44, 44, 44),
                              child: ListTile(
                                leading: Container(
                                  height: 8.h,
                                  width: 10.w,
                                  padding: EdgeInsets.all(14.sp),
                                  margin: EdgeInsets.all(14.sp),
                                  decoration: BoxDecoration(
                                    color: AppColors.appBgColor,
                                    borderRadius: BorderRadius.circular(15.sp),
                                  ),
                                ),

                                title: Text("Service Name"),
                                subtitle: const Text("Loading description..."),
                              ),
                            ),
                          ),
                        )
                        : HomeWidget.ListTile(
                          title: musicServices[index].title.toString(),
                          description: musicServices[index].subTitle.toString(),
                          imgUrl: musicServices[index].imgUrl.toString(),
                          iconUrl: musicServices[index].iconUrl.toString(),
                        );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
