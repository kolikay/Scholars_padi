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
  final _formKey = GlobalKey<FormState>();
  bool _loginError = false;

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
                    Visibility(
                      visible: _loginError,
                      child: Container(
                        color: Colors.pink[100],
                        height: 100,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            const SizedBox(
                                child: Icon(
                              Icons.ac_unit,
                              color: Color(0xffD32f2f),
                              size: 24,
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                                child: NormalText(
                              text:
                                  'we didnt recognize that email address \nor password you can try again or use\n another login option',
                              color: Colors.black54,
                            )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            MyTextField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'The Email Field is required';
                                }
                              },
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
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
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
                          setState(() {
                            _loginError = !_loginError;
                          });
                          print(_loginError);
                          print('hello world');
                          if (_formKey.currentState!.validate()) {}
                          FocusScope.of(context).unfocus();
                        })
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
