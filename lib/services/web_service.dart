// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/status_codes.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/widgets/utils/snack_bar.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'package:dio/dio.dart';
import '../constants/shared_preferences.dart';
import '../screens/authentication/views/login_screen.dart';

class WebServices {
//handles post requests
  static Future sendPostRequest(String url, Object body, context) async {
    final token = UserPreferences.getToken();
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    if (isConnected) {
      try {
        final response = await Dio().post(url,
            data: jsonEncode(body), options: Options(headers: header));

        if (response.statusCode == 200) {
          return Success(code: response.statusCode, response: response.data);
        } else if (response.statusCode == 201) {
          return Success(code: response.statusCode, response: response.data);
        }
      } on DioError catch (error) {
        if (error.response == null) {
          ShowSnackBar.buildErrorSnackbar(context,
              'Server Not Available,Try Again later ', Colors.pink[100]!);
          return Failure(
              code: NO_INTERNET,
              errorResponse: {'error': 'Server Not Available'});
        }
        if (error.response!.statusCode == 422) {
          await UserPreferences.resetSharedPref();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
          ShowSnackBar.buildErrorSnackbar(
              context, 'Access time Out,Please Login ', Colors.pink[100]!);
          return Failure(
              code: error.response!.statusCode,
              errorResponse: {'error': error.response!.data.toString()});
        }

        ShowSnackBar.buildErrorSnackbar(
            context, error.response!.data.toString(), Colors.pink[100]!);

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
    final token = UserPreferences.getToken() ?? '';
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    if (isConnected) {
      try {
        final response =
            await Dio().get(url, options: Options(headers: header));

        if (response.statusCode == 200 || response.statusCode == 201) {
          return Success(code: response.statusCode, response: response.data);
        } else if (response.statusCode == 422) {
          await UserPreferences.resetSharedPref();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
      } on DioError catch (error) {
        if (error.response == null) {
          ShowSnackBar.buildErrorSnackbar(context,
              'Server Not Available,Try Again later ', Colors.pink[100]!);
          return Failure(
              code: NO_INTERNET,
              errorResponse: {'error': 'Server Not Available'});
        }
        // Handle error and display on snackbar
        if (error.response!.statusCode == 422) {
          await UserPreferences.resetSharedPref();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
          ShowSnackBar.buildErrorSnackbar(
              context, 'Access Time Out,Please Login ', Colors.pink[100]!);
          return Failure(
              code: error.response!.statusCode,
              errorResponse: {'error': error.response!.data.toString()});
        }

        ShowSnackBar.buildErrorSnackbar(
            context, error.response!.statusCode.toString(), Colors.pink[100]!);
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
  static Future sendPatchRequest(String url, Object body, context) async {
    final token = UserPreferences.getToken() ?? '';

    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    if (isConnected) {
      try {
        final response = await Dio().patch(url,
            data: jsonEncode(body), options: Options(headers: header));

        if (response.statusCode == 200) {
          return Success(code: response.statusCode, response: response.data);
        } else if (response.statusCode == 201) {
          return Success(code: response.statusCode, response: response.data);
        }
      } on DioError catch (error) {
        if (error.response == null) {
          ShowSnackBar.buildErrorSnackbar(context,
              'Server Not Available,Try Again later ', Colors.pink[100]!);
          return Failure(
              code: NO_INTERNET,
              errorResponse: {'error': 'Server Not Available'});
        }
        // Handle error
        ShowSnackBar.buildErrorSnackbar(
            context, error.response!.data.toString(), Colors.pink[100]!);
        return Failure(code: error.response!.statusCode, errorResponse: {
          'error': error.response!.data.toString(),
        });
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
    final token = UserPreferences.getToken() ?? '';

    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    FormData formData = FormData.fromMap({
      "photo": await MultipartFile.fromFile(image!.path, filename: 'photo'),
    });

    if (isConnected) {
      try {
        final response = await Dio()
            .patch(url, data: formData, options: Options(headers: header));

        if (response.statusCode == 200) {
          return Success(code: response.statusCode, response: response.data);
        } else if (response.statusCode == 201) {
          return Success(code: response.statusCode, response: response.data);
        }
      } on DioError catch (error) {
        if (error.response == null) {
          ShowSnackBar.buildErrorSnackbar(context,
              'Server Not Available,Try Again later ', Colors.pink[100]!);
          return Failure(
              code: NO_INTERNET,
              errorResponse: {'error': 'Server Not Available'});
        }
        // Handle error and display on snackbar
        if (error.response!.statusCode == 422) {
          await UserPreferences.resetSharedPref();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
          return Failure(
              code: error.response!.statusCode,
              errorResponse: {'error': error.response!.data.toString()});
        }

        ShowSnackBar.buildErrorSnackbar(
            context, error.response!.statusCode.toString(), Colors.pink[100]!);
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
    final token = UserPreferences.getToken() ?? '';

    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    if (isConnected) {
      try {
        final response =
            await Dio().delete(url, options: Options(headers: header));

        if (response.statusCode == 200 ||
            response.statusCode == 202 ||
            response.statusCode == 201) {
          return Success(code: response.statusCode, response: response.data);
        } else {
          return Failure(code: 402, errorResponse: {'failed': "failed"});
        }
      } on DioError catch (error) {
        if (error.response == null) {
          ShowSnackBar.buildErrorSnackbar(context,
              'Server Not Available,Try Again later ', Colors.pink[100]!);
          return Failure(
              code: NO_INTERNET,
              errorResponse: {'error': 'Server Not Available'});
        }
        // Handle error and display on snackbar
        if (error.response!.statusCode == 422) {
          await UserPreferences.resetSharedPref();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
          return Failure(
              code: error.response!.statusCode,
              errorResponse: {'error': error.response!.data.toString()});
        }

        ShowSnackBar.buildErrorSnackbar(
            context, error.response!.statusCode.toString(), Colors.pink[100]!);
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
    final token = UserPreferences.getToken() ?? '';

    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    if (isConnected) {
      try {
        final response =
            await Dio().put(url, options: Options(headers: header));

        if (response.statusCode == 200 ||
            response.statusCode == 202 ||
            response.statusCode == 201) {
          return Success(code: response.statusCode, response: response.data);
        } else {
          return Failure(code: 402, errorResponse: {'failed': "failed"});
        }
      } on DioError catch (error) {
        if (error.response == null) {
          ShowSnackBar.buildErrorSnackbar(context,
              'Server Not Available,Try Again later ', Colors.pink[100]!);
          return Failure(
              code: NO_INTERNET,
              errorResponse: {'error': 'Server Not Available'});
        }
        // Handle error and display on snackbar
        if (error.response!.statusCode == 422) {
          await UserPreferences.resetSharedPref();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
          return Failure(
              code: error.response!.statusCode,
              errorResponse: {'error': error.response!.data.toString()});
        }

        ShowSnackBar.buildErrorSnackbar(
            context, error.response!.statusCode.toString(), Colors.pink[100]!);
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
