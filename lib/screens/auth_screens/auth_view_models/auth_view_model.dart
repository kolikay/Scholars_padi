import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/error.dart';
import 'package:scholars_padi/constants/status_codes.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/services/web_service.dart';

class AuthViewModel extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  UserError _userError = UserError();
  UserError get userError => _userError;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  loginUser(url, context) async {

    setLoading(true);
    
    final responce = await WebServices.sendRequest(USERS_LIST, context);
    if (responce is Success) {
      pushTohomePage(context);
    }
    if (responce is Failure) {
      UserError userError = UserError(
        code: responce.code,
        message: 'No Data Found',
      );
      setUserError(userError);
    }
    setLoading(false);
  }
}
