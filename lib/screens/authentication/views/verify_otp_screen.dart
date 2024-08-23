import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/constants/app_state_constants.dart';
import 'package:scholars_padi/constants/shared_preferences.dart';
import 'package:scholars_padi/screens/authentication/auth_view_models/auth_view_model.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/utils/progress_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifyOtpScreen extends ConsumerStatefulWidget {
  const VerifyOtpScreen({
    Key? key,
  }) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends ConsumerState<VerifyOtpScreen> {
  bool _isActive = false;
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;
  final pinController = TextEditingController();

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
    final authViewModel = ref.watch(authViewModelProvider);

    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 24.w),
                color: AppColor.mainColor,
                height: 80.h,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 28.w,
                    ),
                    NormalText(
                      text: 'Verification',
                      color: Colors.white,
                      size: 19.2.sp,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 26.w, right: 25.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NormalText(
                      text: 'Enter verification code to confirm your ',
                      size: 16.sp,
                    ),
                    NormalText(
                      text: 'email',
                      size: 16.sp,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.w, right: 50.w),
                child: PinCodeTextField(
                  controller: pinController,
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
                padding: EdgeInsets.only(right: 50.w),
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
                height: 45.h,
              ),
              ReuseableButton(
                backGroundColor: !_isActive ? Colors.grey : AppColor.mainColor,
                isActive: _isActive,
                text: 'Verify',
                textSize: 14.sp,
                onPressed: () async {
                  String id = UserPreferences.getId() ?? '';

                  await AuthViewModel.instance.verifyUserEmail({
                    "_id": id,
                    "otp": pinController.text,
                  }, context);
                },
              ),
            ],
          ),
          Positioned(
            child: authViewModel.loading
                ? const Center(
                    child: ProgressDialog(
                      message: 'Loading....',
                    ),
                  )
                : const SizedBox(),
          ),
        ],
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
