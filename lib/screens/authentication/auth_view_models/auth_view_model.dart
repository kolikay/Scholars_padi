// import 'dart:io';

import 'package:scholars_padi/screens/authentication/views/verify_otp_screen.dart';
import 'package:universal_io/io.dart';
import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/status_codes.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/services/web_service.dart';
import '../../../widgets/reusesable_widget/reusable_info_widget.dart';

class AuthViewModel extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  bool _loginError = false;
  bool get loginError => _loginError;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setLoginError(bool loginError) {
    _loginError = loginError;
  }

//login funtions
  loginUser(url, Object body, context) async {
    setLoading(true);
    final response = await WebServices.sendPostRequest(url, body, context);

    if (response is Success) {
      pushOnBoardingScreen(context);
      setLoading(false);
    }
    if (response is Failure) {
      setLoginError(true);
      setLoading(false);
    }
    if (response is SocketException) {
      pushToNoInternetPage(context);
      setLoading(false);
    }
    setLoading(false);
  }

  //registration funtions
  registerUser(url, Object body, context) async {
    setLoading(true);
    final response = await WebServices.sendPostRequest(url, body, context);

    if (response is Success) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ReuseableInfoWidget(
            bottonText: 'Confirm Email',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const VerifyOtpScreen(),
                ),
              );
            },
            logo: 'lib/assets/verifyIcon.png',
            maintext: 'Congratulations',
            detailsText:
                'Your account has been successfully created. Kindly go to your email to verify your account. If you did not receive an email, you can resend one',
          ),
        ),
      );

      // pushOnBoardingScreen(context);
      setLoading(false);
    }
    if (response is Failure) {
      setLoginError(true);
      setLoading(false);
    }
    if (response is SocketException) {
      pushToNoInternetPage(context);
      setLoading(false);
    }
    setLoading(false);
  }
}
