import 'package:flutter/material.dart';
import 'package:scholars_padi/screens/home_screens/home_page.dart';
import 'package:scholars_padi/screens/landing_page_screens/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const LandingPage(),
      routes: {
        HomePageScreen.id: (context) =>  HomePageScreen(),
      },
    );
  }
}
