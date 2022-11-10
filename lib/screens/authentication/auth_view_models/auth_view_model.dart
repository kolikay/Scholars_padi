

// import 'dart:io';
import 'package:universal_io/io.dart';
import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/status_codes.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/services/web_service.dart';






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

  loginUser(url,Object body, context) async {
    setLoading(true);
    final response = await WebServices.sendPostRequest(url,  body, context);

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
}
