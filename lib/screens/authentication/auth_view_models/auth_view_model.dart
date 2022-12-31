// import 'dart:io';

import 'package:scholars_padi/constants/app_state_constants.dart';
import 'package:scholars_padi/constants/shared_preferences.dart';
import 'package:scholars_padi/models/models.dart';
import 'package:scholars_padi/screens/authentication/views/login_screen.dart';
import 'package:scholars_padi/screens/authentication/views/verify_otp_screen.dart';
import 'package:scholars_padi/widgets/utils/snack_bar.dart';
import 'package:universal_io/io.dart';
import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/status_codes.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/services/web_service.dart';
import '../../../widgets/reusesable_widget/reusable_info_widget.dart';
import 'package:dio/dio.dart';

class AuthViewModel extends ChangeNotifier {
  Dio dio = Dio();

  static final AuthViewModel _instance = AuthViewModel._();
  AuthViewModel._();

  static AuthViewModel get instance {
    return _instance;
  }

  bool _loading = false;
  bool get loading => _loading;

  bool _loginError = false;
  bool get loginError => _loginError;

// empty list to save user data from api
  List<UserModel> userData = [];

//instance of usermodel
  UserModel userApiData = UserModel();

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setLoginError(bool loginError) {
    _loginError = loginError;
    notifyListeners();
  }

//store user data
  addUserdata(UserModel newUser) {
    userApiData.fullname = newUser.fullname;
    userApiData.email = newUser.email;
    userApiData.username = newUser.username;
    userApiData.confirmed = newUser.confirmed;

    // userApiData.dob = newUser.dob;
    // userApiData.occupation = newUser.occupation;
    // userApiData.photo = newUser.photo;
    // userApiData.about = newUser.about;
    // userApiData.interest = newUser.interest;
    // userApiData.gender = newUser.gender;
  }

//login funtions
  loginUser(url, Object body, context) async {
    setLoading(true);

    try {
      final response = await WebServices.sendPostRequest(
          'http://44.204.69.28/api/account/login/',
          {"email": "kolikay1989@gmail.com", "password": "password"},
          context);

      if (response.code == 200 || response.code == 201) {
        // save login user token from api response

        //uncomment after test
        // UserPreferences.setLoginUerToken(response.response!['access_token']);

        // // get logged in user details
        //uncomment after test
        // await getLoginUserData(context);

        Future.delayed(const Duration(milliseconds: 500), () {
          //navigate to onbording screen after 30 seconds
          pushOnBoardingScreen(context);
        });

        setLoading(false);
        return true;
      } else {
        setLoginError(true);
        setLoading(false);
      }

      if (response is SocketException) {
        pushToNoInternetPage(context);
        setLoading(false);
      }
      setLoading(false);
    } on HttpException catch (e) {
      return e.message;
    }
  }

  //registration funtions
  registerUser(Object body, context) async {
    setLoading(true);
    final response = await WebServices.sendPostRequest(
        '$baseApi/account/register/', body, context);

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
      setLoading(false);
    }
    if (response is SocketException) {
      pushToNoInternetPage(context);
      setLoading(false);
    }
    setLoading(false);
  }

  // save user data function
  Future getLoginUserData(context) async {
    setLoading(true);

    var response = await WebServices.sendGetRequest(
        "$baseApi/account/user/current/", context);

    if (response.code == SUCCESS) {
      final result = response.response;

      addUserdata(UserModel.fromJson(result));
      // userData.add(UserModel.fromJson(result));

      notifyListeners();

      setLoading(false);
    } else {
      setLoading(false);
    }

    setLoading(false);
  }

  //login funtions
  // save user data function
  Future logOutUser(context) async {
    var response =
        await WebServices.sendDeleteRequest("$baseApi/account/logout", context);
    Navigator.pop(context);

    if (response.code == SUCCESS) {
      await UserPreferences.resetSharedPref();
      Navigator.of(context).pushNamedAndRemoveUntil(
          LoginScreen.id, (Route<dynamic> route) => false);
    } else {
      ShowSnackBar.buildErrorSnackbar(
          context, response!.data.toString(), Colors.pink[100]!);
    }

    setLoading(false);
  }

// class AuthRepository {
//   Dio dio = Dio();

//   AuthRepository();

//   Future<bool> login({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final result = await dio.post(
//         'https://reqres.in/api/login',
//         data: {'email': email, 'password': password},
//       );

//       if (result.statusCode != 200) {
//         return false;
//       }
//     } on DioError catch (e) {
//       print(e.message);
//       return false;
//     }

//     return true;
//   }
// }

  //   Future getAllUsers(context) async {
  //   var response = await WebServices.sendGetRequest(
  //     baseApi,
  //     context,
  //   );

  //   if (response.response['statusCode'] == SUCCESS) {
  //     // final  result = jsonDecode(response.response);
  //     final List result = response.response['data']['users'];

  //     // userData = result.map(((e) => AllUsersModel.fromJson(e))).toList();
  //     userData = result.map(((e) => UserModel.fromJson(e))).toList();

  //     notifyListeners();
  //   } else {
  //     throw Failure(
  //         code: UNKNOWN_ERROR, errorResponse: {'error': 'Unknown Error'});
  //   }
  // }
}
