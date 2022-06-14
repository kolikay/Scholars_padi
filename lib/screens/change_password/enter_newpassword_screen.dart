import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/screens/auth_screens/login_screen.dart';
import 'package:scholars_padi/widgets/normal_text.dart';
import 'package:scholars_padi/widgets/reusaable_textformfield.dart';
import 'package:scholars_padi/widgets/reusable_info_widget.dart';
import 'package:scholars_padi/widgets/reuseable_button.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _newpassword1 = TextEditingController();
  final _newpassword2 = TextEditingController();
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 24),
            color: AppColor.mainColor,
            height: 103,
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 28,
                ),
                NormalText(
                  text: 'Create New Passwords',
                  color: Colors.white,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26.0, right: 25.0),
            child: NormalText(
              text: 'Enter your new Passwords',
              size: 16,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                MyTextField(
                  controller: _newpassword1,
                  obcureText: _isObscure,
                  keyBoardType: TextInputType.text,
                  isPassword: false,
                  isReadOnly: false,
                  labelText: 'password',
                  sufixIcon: IconButton(
                    color: Colors.black54,
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                MyTextField(
                  validator: (pass) {
                    if (_newpassword2.text != _newpassword1.text) {
                      return 'Password Dont match';
                    }
                  },
                  controller: _newpassword2,
                  obcureText: _isObscure,
                  keyBoardType: TextInputType.emailAddress,
                  isPassword: false,
                  isReadOnly: false,
                  labelText: 'confirm password',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ReuseableButton(
            text: 'Send Email',
            textSize: 14,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
             
              }
             
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ReuseableInfoWidget(
                    bottonText: 'Proceed',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    logo: 'lib/assets/verifyIcon.png',
                    maintext: 'New Password Set',
                    detailsText:
                        'Your new password has been set successfully \n Proceed to sign in to continue',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}
