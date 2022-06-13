import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
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
  final _emailCont = TextEditingController();
  bool _isActive = false;

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
                    print(_isActive);
                  });
                }
              },
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          ReuseableButton(
            backGroundColor: _isActive ? AppColor.mainColor : AppColor.dullBlack,
            isActive: _isActive,
            text: 'Send Email',
            textSize: 14,
            onPressed: () {
              print('hello world....');
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ReuseableInfoWidget(
                    bottonText: 'Verify',
                    onPressed: () {},
                    logo: 'lib/assets/emailVerifyIcon.png',
                    maintext: 'Email Sent',
                    detailsText:
                        'Resets Instruction has been sent to email kolilay@yahoo.com',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}
