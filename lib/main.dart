import 'package:flutter/material.dart';
import 'package:scholars_padi/screens/home_screens/categories_page.dart';
import 'package:scholars_padi/screens/home_screens/home_page.dart';
import 'package:scholars_padi/screens/landing_page_screens/landing_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



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
           home: CategoriesPage(),
        routes: {
          HomePageScreen.id: (context) => const HomePageScreen(),
        },
        );
      },
      designSize: const Size(375, 812),
    );
  }
}



