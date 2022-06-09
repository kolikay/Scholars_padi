import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/normal_text.dart';
import 'package:scholars_padi/widgets/reusaable_textformfield.dart';
import 'package:scholars_padi/widgets/reuseable_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                  height: 125,
                  width: 125,
                  child: Image.asset(
                    'lib/assets/logo.png',
                    fit: BoxFit.contain,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  NormalText(
                    text: 'Sign In',
                    size: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  NormalText(
                    text: 'Enter your Information to continue',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    obcureText: false,
                    keyBoardType: TextInputType.emailAddress,
                    isPassword: false,
                    isReadOnly: false,
                    labelText: 'Email Address',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                      obcureText: _isObscure,
                      keyBoardType: TextInputType.text,
                      isPassword: true,
                      isReadOnly: false,
                      labelText: 'Enter Password',
                      sufixIcon: IconButton(
                          color: AppColor.mainColor,
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          })),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (){},
                        child: NormalText(
                          text: 'Forgot Password',
                          color: AppColor.mainColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ReuseableButton(
                      text: 'Submit',
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
