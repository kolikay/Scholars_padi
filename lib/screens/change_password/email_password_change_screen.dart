import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/screens/change_password/passord_resetpin_screen.dart';
import 'package:scholars_padi/widgets/normal_text.dart';
import 'package:scholars_padi/widgets/reusaable_textformfield.dart';
import 'package:scholars_padi/widgets/reusable_info_widget.dart';
import 'package:scholars_padi/widgets/reuseable_button.dart';

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
            padding: const EdgeInsets.only(left: 24),
            color: AppColor.mainColor,
            height: 80,
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
                  text: 'Forgot Password',
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
              text:
                  'Enter your email address and we will send you instructions on how to reset your password',
              size: 16,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MyTextField(
            controller: _emailCont,
            obcureText: false,
            keyBoardType: TextInputType.emailAddress,
            isPassword: false,
            isReadOnly: false,
            labelText: 'Email Address',
          ),
          const SizedBox(
            height: 40,
          ),
          ReuseableButton(
            text: 'Send Email',
            textSize: 14,
            onPressed: () {
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
            },
          ),
        ],
      ),
    ));
  }
}
