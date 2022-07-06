import 'package:flutter/material.dart';
import 'package:scholars_padi/screens/landing_page_screens/no_internet.dart';

import '../screens/on_boarding/home_screens/home_page.dart';

pushToNoInternetPage(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const NoInternetScreen(),
    ),
  );
}

pushTohomePage(BuildContext context) async {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => const HomePageScreen(),
    ),
  );
}






