import 'package:flutter/material.dart';
import 'package:scholars_padi/widgets/normal_text.dart';
import 'package:scholars_padi/widgets/reusaable_textformfield.dart';
import 'package:scholars_padi/widgets/reuseable_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                    height: 30,
                  ),
                  NormalText(
                    text: 'Sign In',
                    size: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  NormalText(text: 'Enter your Information to continue', ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    isPassword: false,
                    isReadOnly: false,
                    labelText: 'Email Address',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    isPassword: true,
                    isReadOnly: false,
                    labelText: 'Enter Password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ReuseableButton(text: 'Submit', onPressed: () {})
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
