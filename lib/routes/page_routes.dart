import 'package:flutter/material.dart';
import 'package:scholars_padi/screens/landing_page_screens/no_internet.dart';
import 'package:scholars_padi/screens/on_boarding/home_screens/home_page.dart';
import 'package:scholars_padi/screens/on_boarding/on_boarding_screen.dart';

import '../screens/authentication/views/login_screen.dart';

pushToNoInternetPage(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const NoInternetScreen(),
    ),
  );
}

pushToOnboardingPage(BuildContext context) async {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => const OnBoardingScreen(),
    ),
  );
}

pushToLoginPage(BuildContext context) async {
  Navigator.of(context).pushNamed(LoginScreen.id);
}

pushToHomePage(BuildContext context) async {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => const HomePageScreen(),
    ),
  );
}
