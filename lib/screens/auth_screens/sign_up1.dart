import 'package:flutter/material.dart';
import 'package:scholars_padi/screens/auth_screens/sign_up2.dart';
import 'package:scholars_padi/widgets/normal_text.dart';
import 'package:scholars_padi/widgets/reusaable_textformfield.dart';
import 'package:scholars_padi/widgets/reuseable_button.dart';

class SignUpScreen1 extends StatefulWidget {
  const SignUpScreen1({Key? key}) : super(key: key);

  @override
  State<SignUpScreen1> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen1> {
  final bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: SingleChildScrollView(
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
                      height: 20,
                    ),
                    NormalText(
                      text: 'Create An Account',
                       size: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const MyTextField(
                              obcureText: false,
                              keyBoardType: TextInputType.emailAddress,
                              isPassword: false,
                              isReadOnly: false,
                              labelText: 'Full Name',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyTextField(
                              obcureText: _isObscure,
                              keyBoardType: TextInputType.text,
                              isPassword: false,
                              isReadOnly: false,
                              labelText: 'Username',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyTextField(
                              obcureText: _isObscure,
                              keyBoardType: TextInputType.text,
                              isPassword: false,
                              isReadOnly: false,
                              labelText: 'Faculty',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyTextField(
                              obcureText: _isObscure,
                              keyBoardType: TextInputType.text,
                              isPassword: false,
                              isReadOnly: false,
                              labelText: 'Department',
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ReuseableButton(
                          text: 'Next',
                          size: 18,
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen2(),
                              ),
                            );
                            if (_formKey.currentState!.validate()) {}
                            FocusScope.of(context).unfocus();
                          },
                          width: 90,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
