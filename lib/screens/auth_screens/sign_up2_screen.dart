import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/screens/auth_screens/login_screen.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusaable_textformfield.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_info_widget.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  bool _isObscure1 = true;
  final _formKey = GlobalKey<FormState>();
  final _emailCont = TextEditingController();
  final _password1Cont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.only(top: 40.h, left: 30.w, right: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: 125.h,
                    width: 121.h,
                    child: Image.asset(
                      'lib/assets/logo.png',
                      fit: BoxFit.contain,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 36.h,
                    ),
                    NormalText(
                      text: 'Create an account',
                      size: 23.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 32.h,
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
                          SizedBox(
                            height: 24.h,
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
                            labelText: 'Password',
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
                          SizedBox(
                            height: 24.h,
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
                             sufixIcon: IconButton(
                              color: Colors.black54,
                              icon: Icon(_isObscure1
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure1 = !_isObscure1;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    ReuseableButton(
                      textSize: 14.sp,
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
                                          'Your account has been verified successfully,Please login to continue.',
                                    ),
                                  ),
                                );
                              },
                              logo: 'lib/assets/verifyIcon.png',
                              maintext: 'Congratulations',
                              detailsText:
                                  'Your account has been successfully  created.\nKindly go to your email to verify your account\nIf you did not receive an email, you can resend one.',
                            ),
                          ),
                        );
                        if (_formKey.currentState!.validate()) {}
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 70.h,
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
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.sp,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'Already have an account? ', style: TextStyle(fontSize: 14.sp)),
                            TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                fontSize: 16.sp,
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
