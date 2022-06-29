import 'package:flutter/material.dart';
import 'package:scholars_padi/screens/home_screens/home_page.dart';
import 'package:scholars_padi/screens/landing_page_screens/no_internet.dart';

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







  //   return Failure(
      //       code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
      // } on HttpException {
      //   print('failed oooooooooooo');
      //   return Failure(
      //       code: NO_INTERNET, errorResponse: 'No Internet Connection');
      // } on SocketException {
      //   print('failed ooooo');
      //   return Failure(
      //       code: NO_INTERNET, errorResponse: 'No Internet Connection');
      // } on FormatException {
      //   print('failed ooo');
      //   return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
      // } catch (e) {
      //   print('failed o');
      //   return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
      // }