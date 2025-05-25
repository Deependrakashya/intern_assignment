import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern_project/utils/app_colors.dart';

class NewScreen extends StatelessWidget {
  String lastScreenName;
  NewScreen({super.key, required this.lastScreenName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBgColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back, color: AppColors.textWhiteColor),
        ),
      ),
      body: Center(
        child: Text(
          "You tapped on: $lastScreenName",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
