import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern_project/core/app_contants.dart';
import 'package:intern_project/view/bottom_nav_s.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intern_project/viewModel/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: AppContants.appBgColor,
      systemNavigationBarIconBrightness: Brightness.light, // icons color
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeProvider())],

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Internship Assignment',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Syne',
            scaffoldBackgroundColor: Color(0xff18171c),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Color(0xff18171c),
            ),
            textTheme: TextTheme(),
          ),

          home: BottomNav(),
        );
      },
    );
  }
}
