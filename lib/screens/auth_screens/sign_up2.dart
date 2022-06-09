import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/screens/auth_screens/login_screen.dart';
import 'package:scholars_padi/screens/auth_screens/sign_up1.dart';
import 'package:scholars_padi/widgets/normal_text.dart';
import 'package:scholars_padi/widgets/reusaable_textformfield.dart';
import 'package:scholars_padi/widgets/reuseable_button.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({Key? key}) : super(key: key);

  @override
  State<SignUpScreen2> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen2> {
  bool _isObscure = true;
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
                      text: 'Create an Account',
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
                            labelText: 'Email Address',
                          ),
                          const SizedBox(
                            height: 20,
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
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MyTextField(
                            obcureText: _isObscure,
                            keyBoardType: TextInputType.text,
                            isPassword: true,
                            isReadOnly: false,
                            labelText: 'Confirm Password',
                            sufixIcon: IconButton(
                              color: AppColor.mainColor,
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ReuseableButton(
                      text: 'Submit',
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen1(),
                          ),
                        );
                        if (_formKey.currentState!.validate()) {}
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ],
                ),
               const SizedBox(height: 70,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                            Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.0,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'Already have an account? '),
                            TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                  color: AppColor.mainColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
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
