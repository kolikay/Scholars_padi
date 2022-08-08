import 'package:flutter/material.dart';
import 'package:scholars_padi/screens/authentication/views/login_screen.dart';
import 'package:scholars_padi/screens/landing_page_screens/landing_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scholars_padi/screens/on_boarding/home_screens/categories_page.dart';
import 'package:scholars_padi/screens/on_boarding/on_boarding_screen.dart';
import 'package:scholars_padi/screens/on_boarding/profile_screens/profile_view/profile_screen.dart';
import 'package:scholars_padi/screens/on_boarding/settings/settings_screen.dart';
import 'screens/on_boarding/home_screens/categories_search_screen.dart';
import 'screens/on_boarding/home_screens/home_page.dart';
import 'screens/on_boarding/notifications/testings.dart';




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
           home: const LandingPage(),
        routes: {
          HomePageScreen.id: (context) => const HomePageScreen(),
          CatergoriesSearchScreen.id: (context) => const CatergoriesSearchScreen(),
          CategoriesPage.id: (context) => const CategoriesPage(),
           OnBoardingScreen.id: (context) => const OnBoardingScreen(),
           LoginScreen.id: (context) => const LoginScreen(),
           SettingsScreen.id: ((context) => const SettingsScreen()),
           ProfileScreen.id: ((context) => const ProfileScreen())
        },
        );
      },
      designSize: const Size(375, 812),
    );
  }
}



