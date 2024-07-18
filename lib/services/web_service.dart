import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/status_codes.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/widgets/utils/snack_bar.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'package:dio/dio.dart';
import '../constants/shared_preferences.dart';
import '../screens/authentication/views/login_screen.dart';

class WebServices {
  final dio = Dio();

//handles post requests
  static Future sendPostRequest(String url, Object body, context) async {
    final token = UserPreferences.getUserToken() ?? '';
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'SCHOLAR.S-PADDI $token',
    };
    if (isConnected) {
      try {
        final response = await Dio().post(url,
            data: jsonEncode(body), options: Options(headers: header));

        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 203) {
          return Success(code: response.statusCode, response: response.data);
        }
      } on DioError catch (error) {
        // Handle error and display on snackbar
        if (error.response!.statusCode == 502) {
          await UserPreferences.resetSharedPref();

          ShowSnackBar.buildErrorSnackbar(
              context, 'Server is unavailable', Colors.pink[100]!);
        }

        return Failure(
            code: error.response!.statusCode,
            errorResponse: {'error': error.response!.data.toString()});
      }
      // push to no internet screen if isConnected is false
    } else {
      pushToNoInternetPage(context);
      return Failure(
          code: NO_INTERNET, errorResponse: {'error': 'No Internet'});
    }
  }

//handles get requests
  static Future sendGetRequest(String url, context) async {
    final token = UserPreferences.getUserToken() ?? '';
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'SCHOLAR.S-PADDI $token',
    };
    if (isConnected) {
      try {
        final response =
            await Dio().get(url, options: Options(headers: header));

        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 203) {
          return Success(code: response.statusCode, response: response.data);
        } else if (response.statusCode == 422) {
          await UserPreferences.resetSharedPref();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
      } on DioError catch (error) {
        // Handle error and display on snackbar
        if (error.response!.statusCode == 502) {
          await UserPreferences.resetSharedPref();

          ShowSnackBar.buildErrorSnackbar(
              context, 'Server is unavailable', Colors.pink[100]!);
          return Failure(
              code: error.response!.statusCode,
              errorResponse: {'error': error.response!.data.toString()});
        }
        Failure(
            code: error.response!.statusCode,
            errorResponse: {'error': error.response!.data.toString()});
      }
      //push to no internet screen if isConnected is false
    } else {
      pushToNoInternetPage(context);
      return Failure(
          code: NO_INTERNET, errorResponse: {'error': 'No Internet'});
    }
  }

//handles patch requests
  static Future sendPatchRequest(String url, Object body, context) async {
    final token = UserPreferences.getUserToken() ?? '';

    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'SCHOLAR.S-PADDI $token',
    };

    if (isConnected) {
      try {
        final response = await Dio().patch(url,
            data: jsonEncode(body), options: Options(headers: header));
        print(response.data);

        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 203) {
          return Success(code: response.statusCode, response: response.data);
        }
      } on DioException catch (error) {
        // Handle error and display on snackbar
        if (error.response!.statusCode == 502) {
          ShowSnackBar.buildErrorSnackbar(
              context, 'Server is unavailable', Colors.pink[100]!);
        }
        return Failure(
            code: error.response!.statusCode,
            errorResponse: {'error': error.response!.data.toString()});
      }
      //push to no internet screen if isConnected is false
    } else {
      pushToNoInternetPage(context);
      return Failure(
          code: NO_INTERNET, errorResponse: {'error': 'No Internet'});
    }
  }

  //handles patch requests
  static Future uploadImageToApi(String url, File? image, context) async {
    final token = UserPreferences.getUserToken() ?? '';

    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'SCHOLAR.S-PADDI $token',
    };
    FormData formData = FormData.fromMap({
      "photo": await MultipartFile.fromFile(image!.path, filename: 'photo'),
    });

    if (isConnected) {
      try {
        final response = await Dio()
            .patch(url, data: formData, options: Options(headers: header));

        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 203) {
          return Success(code: response.statusCode, response: response.data);
        }
      } on DioError catch (error) {
        // Handle error and display on snackbar
        if (error.response!.statusCode == 502) {
          await UserPreferences.resetSharedPref();

          ShowSnackBar.buildErrorSnackbar(
              context, 'Server is unavailable', Colors.pink[100]!);
        }

        return Failure(
            code: error.response!.statusCode,
            errorResponse: {'error': error.response!.data.toString()});
      }
      //push to no internet screen if isConnected is false
    } else {
      pushToNoInternetPage(context);
      return Failure(
          code: NO_INTERNET, errorResponse: {'error': 'No Internet'});
    }
  }

  //handles Delete requests
  static Future sendDeleteRequest(String url, context) async {
    final token = UserPreferences.getUserToken() ?? '';

    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'SCHOLAR.S-PADDI $token',
    };
    if (isConnected) {
      try {
        final response =
            await Dio().delete(url, options: Options(headers: header));

        if (response.statusCode == 200 ||
            response.statusCode == 203 ||
            response.statusCode == 201) {
          return Success(code: response.statusCode, response: response.data);
        } else {
          return Failure(code: 402, errorResponse: {'failed': "failed"});
        }
      } on DioError catch (error) {
        // Handle error and display on snackbar
        if (error.response!.statusCode == 502) {
          await UserPreferences.resetSharedPref();

          ShowSnackBar.buildErrorSnackbar(
              context, 'Server is unavailable', Colors.pink[100]!);
        }

        return Failure(
            code: error.response!.statusCode,
            errorResponse: {'error': error.response!.data.toString()});
      }
      //push to no internet screen if isConnected is false
    } else {
      pushToNoInternetPage(context);
      return Failure(
          code: NO_INTERNET, errorResponse: {'error': 'No Internet'});
    }
  }

  //handles Put requests
  static Future sendPutRequest(String url, context) async {
    final token = UserPreferences.getUserToken() ?? '';

    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'SCHOLAR.S-PADDI $token',
    };
    if (isConnected) {
      try {
        final response =
            await Dio().put(url, options: Options(headers: header));

        if (response.statusCode == 200 ||
            response.statusCode == 203 ||
            response.statusCode == 201) {
          return Success(code: response.statusCode, response: response.data);
        } else {
          return Failure(code: 402, errorResponse: {'failed': "failed"});
        }
      } on DioError catch (error) {
        // Handle error and display on snackbar
        if (error.response!.statusCode == 502) {
          await UserPreferences.resetSharedPref();

          ShowSnackBar.buildErrorSnackbar(
              context, 'Server is unavailable', Colors.pink[100]!);
        }

        return Failure(
            code: error.response!.statusCode,
            errorResponse: {'error': error.response!.data.toString()});
      }
      //push to no internet screen if isConnected is false
    } else {
      pushToNoInternetPage(context);
      return Failure(
          code: NO_INTERNET, errorResponse: {'error': 'No Internet'});
    }
  }
}
