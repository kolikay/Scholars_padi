

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




class WebServices {
  final dio = Dio();

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
        final response = await Dio().post(url, data: jsonEncode(body), options: Options(headers: header));

        if (response.statusCode == 200) {
          return Success(code: response.statusCode, response: response.data);
        } else if (response.statusCode == 201) {
          return Success(code: response.statusCode, response: response.data);
        }
      } on DioError catch (error) {
        // Handle error and display on snackbar

        ShowSnackBar.buildErrorSnackbar(
            context, error.response!.data.toString(), Colors.pink[100]!);
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





//handles get requests
  static Future sendGetRequest(String url, context) async {
    final token = UserPreferences.getToken();
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

        if (response.statusCode == 200) {
          return Success(code: response.statusCode, response: response.data);
        }
      } on DioError catch (error) {
        // Handle error
        ShowSnackBar.buildErrorSnackbar(
            context, error.response!.data.toString(), Colors.pink[100]!);
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
    final token =  UserPreferences.getToken();

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
        // Handle error
        ShowSnackBar.buildErrorSnackbar(
            context, error.response!.data.toString(), Colors.pink[100]!);
        return Failure(
            code: error.response!.statusCode,
            errorResponse: {'error': error.response!.data.toString(),});
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


    final token = UserPreferences.getToken();

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
        // Handle error
        ShowSnackBar.buildErrorSnackbar(
            context, error.response!.data.toString(), Colors.pink[100]!);
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


































// class WebServices {
//   static Future<Object> sendRequest(String url, context) async {

//     bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();

//     try {
//       if (isConnected) {
//         var response = await http.get(Uri.parse(url));

//         if (response.statusCode == 200) {
//           Navigator.pop(context);
//           return Success(response: response.body);
//         } else {
//           return Failure(
//               code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
//         }
//       } else {
//         return const SocketException('No Data Found');
//       }
//     } catch (e) {
//       Navigator.pop(context);
//       return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
//     }
//   }
// }


