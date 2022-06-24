import 'package:flutter/material.dart';
import 'package:scholars_padi/screens/home_screens/home_page.dart';
import 'package:scholars_padi/screens/landing_page_screens/landing_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:scholars_padi/screens/landing_page_screens/no_internet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder:
            (BuildContext context, AsyncSnapshot<ConnectivityResult> snapshot) {
          if (snapshot.hasData && snapshot.data != ConnectivityResult.none) {
            return MaterialApp(
              title: 'Skill Connect',
              home: const LandingPage(),
              routes: {
                HomePageScreen.id: (context) => const HomePageScreen(),
              },
            );
          } else {
            return const MaterialApp(home: NoInternetScreen());
          }
        });
  }
}
