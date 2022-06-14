import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/screens/change_password/enter_newpassword_screen.dart';
import 'package:scholars_padi/widgets/normal_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:scholars_padi/widgets/reusable_info_widget.dart';
import 'package:scholars_padi/widgets/reuseable_button.dart';

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
            padding: const EdgeInsets.only(left: 24),
            color: AppColor.mainColor,
            height: 103,
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 28,
                ),
                NormalText(
                  text: 'Verification',
                  color: Colors.white,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26.0, right: 25.0),
            child: NormalText(
              text: 'Enter verification code to reset your password',
              size: 16,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
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
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: PinCodeTextField(
              keyboardType: TextInputType.number,
              length: 4,
              appContext: context,
              obscureText: true,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                selectedColor: AppColor.mainColor,
                activeColor: AppColor.mainColor,
                inactiveColor: AppColor.dullBlack,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 46,
                fieldWidth: 53,
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
          TextButton(
            onPressed: enableResend ? _resendCode : null,
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16.0,
                ),
                children: <TextSpan>[
                  const TextSpan(
                      text: 'Didnt you receive an Otp? ',
                      style:
                          TextStyle(color: AppColor.dullBlack, fontSize: 16)),
                  TextSpan(
                    text: 'Resend',
                    style: TextStyle(
                        color: enableResend
                            ? AppColor.mainColor
                            : AppColor.dullBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          ReuseableButton(
            backGroundColor:
                _isActive ? AppColor.mainColor : AppColor.dullBlack,
            isActive: _isActive,
            text: 'Verify',
            textSize: 14,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ReuseableInfoWidget(
                    bottonText: 'Proceed',
                    onPressed: () {
                      print('preesed');
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
    print('resent');
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
