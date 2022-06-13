import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/screens/auth_screens/login_screen.dart';
import 'package:scholars_padi/widgets/normal_text.dart';
import 'package:scholars_padi/widgets/reusaable_textformfield.dart';
import 'package:scholars_padi/widgets/reusable_info_widget.dart';
import 'package:scholars_padi/widgets/reuseable_button.dart';

class SignUpScreen2 extends StatefulWidget {
  final String fullName;
  final String userName;
  final String? faculty;
  final String? department;

  const SignUpScreen2({
    Key? key,
    required this.fullName,
    required this.userName,
    this.department,
    this.faculty,
  }) : super(key: key);
  @override
  State<SignUpScreen2> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen2> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final _emailCont = TextEditingController();
  final _password1Cont = TextEditingController();

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
                    width: 121.25,
                    child: Image.asset(
                      'lib/assets/logo.png',
                      fit: BoxFit.contain,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 35.79,
                    ),
                    NormalText(
                      text: 'Create an account',
                      size: 23,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          MyTextField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Field Cannot be empty';
                              }
                            },
                            controller: _emailCont,
                            obcureText: false,
                            keyBoardType: TextInputType.emailAddress,
                            isPassword: false,
                            isReadOnly: false,
                            labelText: 'Email Address',
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          MyTextField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Field Cannot be empty';
                              }
                            },
                            controller: _password1Cont,
                            obcureText: _isObscure,
                            keyBoardType: TextInputType.text,
                            isPassword: true,
                            isReadOnly: false,
                            labelText: 'Enter Password',
                            sufixIcon: IconButton(
                              color: Colors.black54,
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
                            height: 24,
                          ),
                          MyTextField(
                            validator: (pass) {
                              if (pass != _password1Cont.text) {
                                return 'Password Dont match';
                              }
                            },
                            obcureText: _isObscure,
                            keyBoardType: TextInputType.text,
                            isPassword: true,
                            isReadOnly: false,
                            labelText: 'Confirm Password',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ReuseableButton(
                      textSize: 14,
                      text: 'Sign Up',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ReuseableInfoWidget(
                              bottonText: 'Resend Verification Code',
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ReuseableInfoWidget(
                                      bottonText: 'Proceed to login',
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen(),
                                          ),
                                        );
                                      },
                                      logo: 'lib/assets/emailVerifyIcon.png',
                                      maintext: 'Email Verified',
                                      detailsText:
                                          'Your account has been verified successfully, please login to continue.',
                                    ),
                                  ),
                                );
                              },
                              logo: 'lib/assets/verifyIcon.png',
                              maintext: 'Congratulations',
                              detailsText:
                                  'Your account has been created successfully, Kindly go to your email to verify your account, If you didnt not receive an email, you can resent another.',
                            ),
                          ),
                        );
                        if (_formKey.currentState!.validate()) {}
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
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
                            TextSpan(text: 'Already have an account? ', style: TextStyle(fontSize: 14)),
                            TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                fontSize: 16,
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
