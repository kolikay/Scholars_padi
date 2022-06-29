import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/constants/status_codes.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/screens/auth_screens/sign_up1_screen.dart';
import 'package:scholars_padi/screens/change_password/email_password_change_screen.dart';
import 'package:scholars_padi/screens/home_screens/home_page.dart';
import 'package:scholars_padi/services/web_service.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusaable_textformfield.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_button.dart';
import 'package:scholars_padi/widgets/utils/progress_bar.dart';

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(
                    height: 125,
                    width: 121.21,
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
                      text: 'Sign In',
                      size: 23,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    NormalText(
                      text: 'Enter your info to continue',
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Visibility(
                      visible: _loginError,
                      child: Container(
                        color: Colors.pink[100],
                        height: 100,
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
                              size: 14,
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
                              height: 24,
                            ),
                            MyTextField(
                                obcureText: _isObscure,
                                keyBoardType: TextInputType.text,
                                isPassword: true,
                                isReadOnly: false,
                                labelText: 'Enter Password',
                                sufixIcon: IconButton(
                                    color: AppColor.dullBlack,
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
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const EmailPasswordChangeScreen(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: NormalText(
                            size: 14,
                            text: 'Forgot Password?',
                            color: AppColor.mainColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ReuseableButton(
                      text: 'Sign In',
                      textSize: 14,
                      onPressed: () async {
                        //check if connectivity is available then send request to server
                        final responce =
                            await UserServices.sendRequest(USERS_LIST, context);
                        if (responce is Success) {
                          pushTohomePage(context);
                        } else {
                          setState(() {
                            _loginError = true;
                          });
                        }
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
                            builder: (context) => const SignUpScreen1(),
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
                            TextSpan(
                                text: 'Dont have an account? ',
                                style: TextStyle(
                                    color: AppColor.dullBlack, fontSize: 14)),
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                  color: AppColor.mainColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
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
