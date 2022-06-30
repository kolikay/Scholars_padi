import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/error.dart';
import 'package:scholars_padi/constants/status_codes.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/screens/landing_page_screens/no_internet.dart';
import 'package:scholars_padi/services/web_service.dart';

class AuthViewModel extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  // UserError _userError = UserError();

  // UserError get userError => _userError;

  bool _loginError = false;
  bool get loginError => _loginError;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  // setUserError(UserError userError) {
  //   _userError = userError;
  // }

  setLoginError(bool loginError) {
    _loginError = loginError;
  }

  loginUser(url, context) async {
    setLoading(true);

    final response = await WebServices.sendRequest(url, context);

    if (response is Success) {
      pushTohomePage(context);
    }
    if (response is Failure) {
      setLoginError(true);
    }
    if (response is SocketException) {
      pushToNoInternetPage(context);
      setLoading(false);
    }
    setLoading(false);
  }
}
