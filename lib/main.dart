import 'package:flutter/material.dart';
import 'package:scholars_padi/screens/home_screens/home_page.dart';
import 'package:scholars_padi/screens/landing_page_screens/landing_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Skill Connect',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
           home: const LandingPage(),
        routes: {
          HomePageScreen.id: (context) => const HomePageScreen(),
        },
        );
      },
    );
  }
}



