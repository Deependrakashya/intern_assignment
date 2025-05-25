import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern_project/repo/locator.dart';
import 'package:intern_project/utils/app_colors.dart';
import 'package:intern_project/utils/constants.dart';
import 'package:intern_project/utils/provider/provider.dart';
import 'package:intern_project/view/bottom_nav_s.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() async {
  // Initialize the required things
  await _init();

  // Run the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MultiProvider(
          providers: ProviderList.providers,
          child: MaterialApp(
            title: Constants.appName,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Color(0xff18171c),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Color(0xff18171c),
              ),
              textTheme: TextTheme(),
            ),
            home: BottomNav(),
          ),
        );
      },
    );
  }
}

Future<void> _init() async {
  // Ensure that framework is initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();

  // Set the overlay style for the system UI
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.appBgColor,
      systemNavigationBarIconBrightness: Brightness.light, // icons color
      statusBarColor: AppColors.transparentColor,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  // Set the orientation to portrait only
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);

  // Initialize Firebase
  await Firebase.initializeApp();

  // Register dependencies
  setupLocator();
}
