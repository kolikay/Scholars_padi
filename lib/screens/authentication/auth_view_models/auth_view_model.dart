// import 'dart:io';

import 'package:scholars_padi/constants/app_state_constants.dart';
import 'package:scholars_padi/models/models.dart';
import 'package:scholars_padi/screens/authentication/views/verify_otp_screen.dart';
import 'package:scholars_padi/widgets/utils/snack_bar.dart';
import 'package:universal_io/io.dart';
import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/status_codes.dart';
import 'package:scholars_padi/routes/page_routes.dart';

import '../../../services/web_service.dart';
import '../../../widgets/reusesable_widget/reusable_info_widget.dart';
import 'package:dio/dio.dart';
import 'package:scholars_padi/constants/shared_preferences.dart';

import '../views/login_screen.dart';

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
    print(newUser.email);
    print('object');
    userApiData.fullname = newUser.fullname;
    userApiData.email = newUser.email;
    userApiData.username = newUser.username;
    userApiData.confirmed = newUser.confirmed;
    userData.add(newUser);

    // userApiData.dob = newUser.dob;
    // userApiData.occupation = newUser.occupation;
    // userApiData.photo = newUser.photo;
    // userApiData.about = newUser.about;
    // userApiData.interest = newUser.interest;
    // userApiData.gender = newUser.gender;
  }

  //registration funtions
  registerUser(Object body, context) async {
    setLoading(true);
    final response = await WebServices.sendPostRequest(
        '$baseApi/auth/signup', body, context);

    try {
      if (response.code == 200 || response.code == 201) {
        UserPreferences.setLoginUserId(response.response!["userData"]['_id']);

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
    } catch (e) {}
  }

  //Verify email funtions
  verifyUserEmail(Object body, context) async {
    try {
      setLoading(true);
      final response = await WebServices.sendPostRequest(
          '$baseApi/auth/verify-otp', body, context);
      if (response is Success) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ReuseableInfoWidget(
              bottonText: 'Proceed to login',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              logo: 'lib/assets/emailVerifyIcon.png',
              maintext: 'Email Verified',
              detailsText:
                  'Your account has been verified successfully, Please login to continue.',
            ),
          ),
        );

        setLoading(false);
        return Success;
      }
      if (response is Failure) {
        ShowSnackBar.buildErrorSnackbar(
            context, 'Email Verification Failed', Colors.pink[100]!);
        setLoading(false);
      }
      if (response is SocketException) {
        pushToNoInternetPage(context);
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
    }
  }

  //request OTP funtions
  requestOTP(Object body, context) async {
    try {
      setLoading(true);
      final response = await WebServices.sendPostRequest(
          '$baseApi/auth/request-otp', body, context);
      if (response is Success) {
        ShowSnackBar.buildErrorSnackbar(
            context, 'Otp Sent to your email, ', Colors.green);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const VerifyOtpScreen(),
          ),
        );

        setLoading(false);
        return Success;
      }
      if (response is Failure) {
        ShowSnackBar.buildErrorSnackbar(
            context, 'Could not send Otp, Please try again', Colors.pink[100]!);
        setLoading(false);
      }
      if (response is SocketException) {
        pushToNoInternetPage(context);
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
    }
  }

  //request OTP funtions
  forgetPassword(Object body, context) async {
    try {
      setLoading(true);
      final response = await WebServices.sendPostRequest(
          '$baseApi/auth/forgetPass', body, context);
      if (response is Success) {
        ShowSnackBar.buildErrorSnackbar(
            context, 'Otp Sent to your email, ', Colors.green);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const VerifyOtpScreen(),
          ),
        );

        setLoading(false);
        return Success;
      }
      if (response is Failure) {
        ShowSnackBar.buildErrorSnackbar(
            context, 'Could not send Otp, Please try again', Colors.pink[100]!);
        setLoading(false);
      }
      if (response is SocketException) {
        pushToNoInternetPage(context);
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
    }
  }

//login funtions
  loginUser(Object body, context) async {
    try {
      setLoading(true);
      final response = await WebServices.sendPostRequest(
          '$baseApi/auth/signin', body, context);

      if (response.code == 200 || response.code == 201) {
        //save logged in User Token
        UserPreferences.setUserToken(response.response!["userData"]['token']);

        //save logged in User ID
        UserPreferences.setLoginUserId(
            response.response!["userData"]["user"]['_id']);

        // check if user is verified
        bool verified = response.response!["userData"]["user"]['verified'];

        if (verified == true) {
          // get logged in user details
          // uncomment after test
          // await getLoginUserData(context);

          Future.delayed(const Duration(milliseconds: 500), () {
            //navigate to onbording screen after 30 seconds
            pushOnBoardingScreen(context);
          });
          addUserdata(UserModel.fromJson(response.response!["userData"]["user"]));

          notifyListeners();
          setLoading(false);
        } else {
          String? email = UserPreferences.getEmail() ?? '';

          requestOTP({'email': email}, context);

          ShowSnackBar.buildErrorSnackbar(context,
              'Please Verify Your Email to continue', Colors.pink[100]!);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const VerifyOtpScreen(),
            ),
          );
        }

        setLoading(false);
        return true;
      }
      //  else if (response.code == 400) {
      //   print('object');
      //   print(response.code);
      //   setLoginError(true);
      //   setLoading(false);
      //   return false;
      // }
      else {
        setLoading(false);
        return false;
      }

      // if (response is SocketException) {
      //   pushToNoInternetPage(context);
      //   setLoading(false);
      // }
      // setLoading(false);
    } on HttpException catch (e) {
      setLoading(false);
      return e.message;
    }
  }

  //request OTP for Forget Password
  changePassword(Object body, context) async {
    try {
      setLoading(true);
      final response = await WebServices.sendPatchRequest(
          '$baseApi/auth/verify-forget-password', body, context);
      if (response is Success) {
        ShowSnackBar.buildErrorSnackbar(
            context, 'Password Changed Successfully, ', Colors.green);

        setLoading(false);
        return Success;
      }
      if (response is Failure) {
        ShowSnackBar.buildErrorSnackbar(
            context, 'Password reset failed', Colors.pink[100]!);
        setLoading(false);
      }
      if (response is SocketException) {
        pushToNoInternetPage(context);
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
    }
  }

  // save user data function
  Future getLoginUserDat(context) async {
    setLoading(true);

    var response = await WebServices.sendGetRequest(
        "$baseApi/account/user/current/", context);

    if (response.code == SUCCESS) {
      final result = response.response;

      addUserdata(UserModel.fromJson(result));

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
        await WebServices.sendGetRequest("$baseApi/auth/signout", context);

    if (response.code == 200 || response.code == 203) {
      await UserPreferences.resetSharedPref();
      Navigator.of(context).pushNamedAndRemoveUntil(
          LoginScreen.id, (Route<dynamic> route) => false);
      return true;
    } else {
      ShowSnackBar.buildErrorSnackbar(
          context, response.errorResponse.toString(), Colors.pink[100]!);
      return false;
    }
  }
}
