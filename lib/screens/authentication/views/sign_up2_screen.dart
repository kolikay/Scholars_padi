import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/constants/app_state_constants.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusaable_textformfield.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scholars_padi/widgets/utils/progress_bar.dart';

class SignUpScreen2 extends ConsumerStatefulWidget {
  final String fullName;
  final String userName;
  final String faculty;
  final String? department;
  final String gender;

  const SignUpScreen2({
    Key? key,
    required this.fullName,
    required this.userName,
    this.department,
    required this.faculty,
    required this.gender,
  }) : super(key: key);
  @override
  ConsumerState<SignUpScreen2> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen2> {
  bool _isObscure = true;
  bool _isObscure1 = true;
  final _formKey = GlobalKey<FormState>();
  final _emailCont = TextEditingController();
  final _password1Cont = TextEditingController();

  getInputedData() {
    final body = {
      "full_name": widget.fullName.trim(),
      "username": widget.userName.trim(),
      "gender": widget.gender.trim(),
      "email": _emailCont.text.trim(),
      "faculty": widget.faculty.trim(),
      "password_hash": _password1Cont.text.trim(),

      
    };
    return body;
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.h, left: 30.w, right: 20.w),
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
                                  return null;
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
                                  return null;
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
                                  return null;
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
                            if (_formKey.currentState!.validate()) {
                              authViewModel.registerUser(
                                  '$baseApi/account/register',
                                  getInputedData(),
                                  context);
                            }
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
                            pushToLoginPage(context);
                          },
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16.sp,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Already have an account? ',
                                    style: TextStyle(fontSize: 14.sp)),
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
            Positioned(
              child: authViewModel.loading
                  ? const Center(
                      child: ProgressDialog(
                        message: 'Loading....',
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
