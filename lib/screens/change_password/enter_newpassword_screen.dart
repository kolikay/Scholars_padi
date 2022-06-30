import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/screens/authentication/views/login_screen.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusaable_textformfield.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_info_widget.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    bool _isObscure1 = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 24.w),
            color: AppColor.mainColor,
            height: 80.h,
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 28.w,
                ),
                NormalText(
                  text: 'Create Your New Password',
                  color: Colors.white,
                  size: 19.2.sp,
                )
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 26.w, right: 25.w),
            child: NormalText(
              text: 'Enter your new Passwords',
              size: 16.sp,
            ),
          ),
          SizedBox(
            height: 24.h,
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
                  labelText: 'Password',
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
                SizedBox(
                  height: 40.h,
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
                  labelText: 'Confirm password',
                    sufixIcon: IconButton(
                    color: Colors.black54,
                    icon: Icon(
                        _isObscure1 ? Icons.visibility : Icons.visibility_off),
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
            text: 'Send Email',
            textSize: 14.sp,
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
