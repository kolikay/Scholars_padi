import 'package:flutter/material.dart';
import 'package:scholars_padi/screens/auth_screens/sign_up2_screen.dart';
import 'package:scholars_padi/widgets/normal_text.dart';
import 'package:scholars_padi/widgets/reusaable_textformfield.dart';
import 'package:scholars_padi/widgets/reuseable_button.dart';

class SignUpScreen1 extends StatefulWidget {
  const SignUpScreen1({Key? key}) : super(key: key);

  @override
  State<SignUpScreen1> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen1> {
  final _formKey = GlobalKey<FormState>();
  final _fullnameCont = TextEditingController();
  final _usernameCont = TextEditingController();
  final _facultyCont = TextEditingController();
  final _departmentCont = TextEditingController();

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
                              controller: _fullnameCont,
                              obcureText: false,
                              keyBoardType: TextInputType.emailAddress,
                              isPassword: false,
                              isReadOnly: false,
                              labelText: 'Full Name',
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
                              controller: _usernameCont,
                              obcureText: false,
                              keyBoardType: TextInputType.text,
                              isPassword: false,
                              isReadOnly: false,
                              labelText: 'Username',
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            MyTextField(
                              controller: _facultyCont,
                              obcureText: false,
                              keyBoardType: TextInputType.text,
                              isPassword: false,
                              isReadOnly: false,
                              labelText: 'Faculty',
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            MyTextField(
                              controller: _departmentCont,
                              obcureText: false,
                              keyBoardType: TextInputType.text,
                              isPassword: false,
                              isReadOnly: false,
                              labelText: 'Department',
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ReuseableButton(
                          text: 'Next',
                          textSize: 14,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen2(
                                    fullName: _fullnameCont.text,
                                    userName: _usernameCont.text,
                                    department: _departmentCont.text,
                                    faculty: _facultyCont.text,
                                  ),
                                ),
                              );
                            }
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
