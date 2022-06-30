import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/screens/change_password/enter_newpassword_screen.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
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
      body: Column(
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
            height: 2.h,
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
            height: 25.h,
          ),
    
          Padding(
            padding: EdgeInsets.only(left: 50.w, right: 50.w),
            child: PinCodeTextField(
              keyboardType: TextInputType.number,
              length: 4,
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
                if (val.length > 3) {
                  setState(() {
                    _isActive = !_isActive;
                  });
                }
              },
            ),
          ),
          Padding(
            padding:EdgeInsets.only(right: 50.w),
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
                      style:
                          TextStyle(color: AppColor.dullBlack, fontSize: 16.sp)),
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
            height: 45.h,
          ),
          ReuseableButton(
            backGroundColor:
                _isActive ? AppColor.mainColor : AppColor.dullBlack,
            isActive: _isActive,
            text: 'Verify',
            textSize: 14.sp,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ReuseableInfoWidget(
                    bottonText: 'Proceed',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const NewPasswordScreen()),
                      );
                    },
                    logo: 'lib/assets/emailVerifyIcon.png',
                    maintext: 'Verification successful',
                    detailsText:
                        'Your email verification is successfull. \n Proceed to reset a new password',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }

  void _resendCode() {
    //other code here
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
