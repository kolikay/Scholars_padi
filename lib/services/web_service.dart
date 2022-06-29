import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scholars_padi/constants/status_codes.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

class UserServices {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static Future<Object> sendRequest(String url, context) async {
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();

    try {
      if (isConnected) {
        var response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          return Success(response: response.body);
        }
        return Failure(
            code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
      }
      return pushToNoInternetPage(context);
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
