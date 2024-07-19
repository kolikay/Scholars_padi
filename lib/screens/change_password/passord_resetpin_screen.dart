// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/constants/shared_preferences.dart';
import 'package:scholars_padi/constants/status_codes.dart';
import 'package:scholars_padi/screens/authentication/auth_view_models/auth_view_model.dart';
import 'package:scholars_padi/screens/authentication/views/login_screen.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusaable_textformfield.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_info_widget.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordResetPinScreen extends StatefulWidget {
  const PasswordResetPinScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<PasswordResetPinScreen> createState() => _PasswordResetPinScreenState();
}

class _PasswordResetPinScreenState extends State<PasswordResetPinScreen> {
  bool _isActive = false;
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;
  final _newpassword1 = TextEditingController();
  final _newpassword2 = TextEditingController();
  final _otp = TextEditingController();
  bool _isObscure = true;
  bool _isObscure1 = true;
  final _formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 24.w),
              color: AppColor.mainColor,
              height: 80.h,
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 28.w,
                  ),
                  NormalText(
                    text: 'Verification',
                    color: Colors.white,
                    size: 19.2.sp,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 26.w, right: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NormalText(
                    text: 'Enter verification code to reset your',
                    size: 16.sp,
                  ),
                  NormalText(
                    text: 'Password',
                    size: 16.sp,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: PinCodeTextField(
                controller: _otp,
                keyboardType: TextInputType.number,
                length: 5,
                appContext: context,
                obscureText: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  fieldOuterPadding: EdgeInsets.symmetric(vertical: 15.h),
                  shape: PinCodeFieldShape.box,
                  selectedColor: AppColor.mainColor,
                  activeColor: AppColor.mainColor,
                  inactiveColor: AppColor.dullBlack,
                  borderRadius: BorderRadius.circular(5.r),
                  fieldHeight: 46.h,
                  fieldWidth: 53.w,
                  activeFillColor: Colors.white,
                ),
                onChanged: (val) {
                  if (val.length > 4) {
                    setState(() {
                      _isActive = !_isActive;
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NormalText(
                    text: '00.$secondsRemaining' 'sec',
                    color: AppColor.dullBlack,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  MyTextField(
                    controller: _newpassword1,
                    obcureText: _isObscure,
                    keyBoardType: TextInputType.text,
                    isPassword: false,
                    isReadOnly: false,
                    labelText: 'Password',
                    sufixIcon: IconButton(
                      color: Colors.black54,
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyTextField(
                    validator: (pass) {
                      if (_newpassword2.text != _newpassword2.text) {
                        return 'Password Dont match';
                      }
                      return null;
                    },
                    controller: _newpassword2,
                    obcureText: _isObscure,
                    keyBoardType: TextInputType.emailAddress,
                    isPassword: false,
                    isReadOnly: false,
                    labelText: 'Confirm password',
                    sufixIcon: IconButton(
                      color: Colors.black54,
                      icon: Icon(_isObscure1
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure1 = !_isObscure1;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: enableResend ? _resendCode : null,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16.sp,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Didn\'t you receive an Otp? ',
                        style: TextStyle(
                            color: AppColor.dullBlack, fontSize: 16.sp)),
                    TextSpan(
                      text: 'Resend Code',
                      style: TextStyle(
                          color: enableResend
                              ? AppColor.mainColor
                              : AppColor.dullBlack,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            ReuseableButton(
              backGroundColor:
                  _isActive ? AppColor.mainColor : AppColor.dullBlack,
              isActive: _isActive,
              text: 'Verify',
              textSize: 14.sp,
              onPressed: () async {
                var responce = await AuthViewModel.instance.changePassword({
                  "otp": _otp.text,
                  "password": _newpassword1.text,
                  "passConfirm": _newpassword2.text,
                }, context);
                if (responce == Success) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReuseableInfoWidget(
                        bottonText: 'Proceed',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        logo: 'lib/assets/emailVerifyIcon.png',
                        maintext: 'Password change was successful',
                        detailsText:
                            'Your password change is successful. \n Proceed to Login',
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    ));
  }

  void _resendCode() async {
    String? email = UserPreferences.getEmail();
    await AuthViewModel.instance.requestOTP({
      "email": email,
    }, context);
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  dispose() {
    timer!.cancel();
    super.dispose();
  }
}
