import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern_project/utils/app_colors.dart';
import 'package:intern_project/model/music_services_model.dart';
import 'package:intern_project/repo/firestore_services.dart';
import 'package:intern_project/view/home/home_widget.dart';
import 'package:intern_project/view/new_screen.dart/new_screen.dart';
import 'package:intern_project/viewModel/home/home_view_model.dart';
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
    bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;

    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                //  Top Panel Ui
                HomeWidget.TopBgUI(isTablet: isTablet),
                // middle text
                Container(
                  margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                  child: Text(
                    "Hire hand-picked Pros for popular music services",
                    style: TextStyle(
                      color: AppColors.textWhiteColor,
                      fontFamily: "Syne",
                    ),
                  ),
                ),

                // displaying Music services from firestore
                Container(
                  height: isTablet ? 33.h : 45.h,
                  child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    itemCount:
                        provider.isLoading ? 4 : provider.musicServices.length,
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var musicServices = provider.musicServices;
                      return provider.isLoading
                          ?
                          // show loading skeleton when data is coming from firestore
                          Skeletonizer(
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
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Card(
                                color: const Color.fromARGB(255, 44, 44, 44),
                                child: ListTile(
                                  leading: Container(
                                    height: isTablet ? 20 : 8.h,
                                    width: isTablet ? 20 : 10.w,
                                    padding: EdgeInsets.all(14.sp),
                                    margin: EdgeInsets.all(14.sp),
                                    decoration: BoxDecoration(
                                      color: AppColors.appBgColor,
                                      borderRadius: BorderRadius.circular(
                                        isTablet ? 30.sp : 15.sp,
                                      ),
                                    ),
                                  ),

                                  title: Text("Service Name"),
                                  subtitle: const Text(
                                    "Loading description...",
                                  ),
                                ),
                              ),
                            ),
                          )
                          :
                          // showing actual tiles when the data fetched form firestore
                          GestureDetector(
                            onTap: () {
                              // Navigating to New screen page with sending title of Tile which is pressed
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder:
                                      (context) => NewScreen(
                                        lastScreenName:
                                            musicServices[index].title
                                                .toString(),
                                      ),
                                ),
                              );
                            },
                            // custom list tile for Music services
                            child: HomeWidget.ListTile(
                              title: musicServices[index].title.toString(),
                              description:
                                  musicServices[index].subTitle.toString(),
                              imgUrl: musicServices[index].imgUrl.toString(),
                              iconUrl: musicServices[index].iconUrl.toString(),
                              isTablet: isTablet,
                            ),
                          );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
