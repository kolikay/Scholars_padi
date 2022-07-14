import 'package:flutter/material.dart';
import 'package:scholars_padi/screens/authentication/views/login_screen.dart';
import 'package:scholars_padi/screens/landing_page_screens/landing_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scholars_padi/screens/material/reuseable_material_screen_results.dart';
import 'package:scholars_padi/screens/on_boarding/on_boarding_screen.dart';
import 'screens/material/material_screen.dart';
import 'screens/on_boarding/home_screens/categories_search_screen.dart';
import 'screens/on_boarding/home_screens/home_page.dart';




void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return MaterialApp(
          title: 'Skill Connect',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
           home: const ReuseableMaterialScreen(),
        routes: {
          HomePageScreen.id: (context) => const HomePageScreen(),
          CatergoriesSearchScreen.id: (context) => const CatergoriesSearchScreen(),
           OnBoardingScreen.id: (context) => const OnBoardingScreen(),
           LoginScreen.id: (context) => const LoginScreen(),
        },
        );
      },
      designSize: const Size(375, 812),
    );
  }
}



