import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/constants/shared_preferences.dart';
import 'package:scholars_padi/constants/status_codes.dart';
import 'package:scholars_padi/screens/authentication/auth_view_models/auth_view_model.dart';
import 'package:scholars_padi/screens/change_password/passord_resetpin_screen.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusaable_textformfield.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_info_widget.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailPasswordChangeScreen extends StatefulWidget {
  const EmailPasswordChangeScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<EmailPasswordChangeScreen> createState() =>
      _EmailPasswordChangeScreenState();
}

class _EmailPasswordChangeScreenState extends State<EmailPasswordChangeScreen> {
  final _emailCont = TextEditingController();

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
                  text: 'Forgot Password',
                  color: Colors.white,
                  size: 19.2.sp,
                )
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 26.w, right: 25.w),
            child: NormalText(
              text:
                  'Enter your email address and we will send you instructions on how to reset your password',
              size: 16,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          MyTextField(
            controller: _emailCont,
            obcureText: false,
            keyBoardType: TextInputType.emailAddress,
            isPassword: false,
            isReadOnly: false,
            labelText: 'Email Address',
          ),
          SizedBox(
            height: 40.h,
          ),
          ReuseableButton(
            text: 'Send Email',
            textSize: 14.sp,
            onPressed: () async {
              UserPreferences.setEmail(_emailCont.text);
              var responce = await AuthViewModel.instance.requestOTP({
                "email": _emailCont.text,
              }, context);

              if (responce == Success) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReuseableInfoWidget(
                      bottonText: 'Proceed',
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) =>
                                const PasswordResetPinScreen(),
                          ),
                        );
                      },
                      logo: 'lib/assets/emailVerifyIcon.png',
                      maintext: 'Email Sent',
                      detailsText:
                          'Resets Instruction has been sent to email kolilay@yahoo.com',
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    ));
  }
}
