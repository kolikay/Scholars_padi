import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusaable_textformfield.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool readOnly = true;
  bool onEdit = false;
  final _formKey = GlobalKey<FormState>();
  final _fullnameCont = TextEditingController();
  final _usernameCont = TextEditingController();
  final _facultyCont = TextEditingController();
  final _departmentCont = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isObscure = true;
  bool _isObscure1 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.darkContainer,
        child: Column(
          children: [
            Container(
              height: 123.h,
              color: AppColor.mainColor,
              child: Padding(
                padding: EdgeInsets.only(top:20.0.h),
                child: ReuseableAppbar(
                    appBarTitle: 'Profile',
                    firstButton: () {
                      Navigator.pop(context);
                    },
                    secondButton: () {
                      setState(() {
                        onEdit = !onEdit;
                      });
                    },
                    firstAppIcon: onEdit ? Icons.arrow_back_ios : Icons.cancel,
                    secondAppIcon: onEdit ? Icons.save : Icons.edit,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Container(
              height: 90.h,
              width: 100.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'lib/assets/homepageimage.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            NormalText(
              text: 'Kolawole Johnson',
              fontWeight: FontWeight.w500,
              size: 19.2.sp,
            ),
            SizedBox(
              height: 24.h,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyTextField(
                      controller: _fullnameCont,
                      obcureText: false,
                      keyBoardType: TextInputType.text,
                      isPassword: false,
                      isReadOnly: !onEdit,
                      labelText: 'Full Name',
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    MyTextField(
                      controller: _usernameCont,
                      obcureText: false,
                      keyBoardType: TextInputType.text,
                      isPassword: false,
                      isReadOnly: !onEdit,
                      labelText: 'Username',
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    MyTextField(
                      controller: _facultyCont,
                      obcureText: false,
                      keyBoardType: TextInputType.text,
                      isPassword: false,
                      isReadOnly: !onEdit,
                      labelText: 'Faculty',
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    MyTextField(
                      controller: _departmentCont,
                      obcureText: false,
                      keyBoardType: TextInputType.text,
                      isPassword: false,
                      isReadOnly: !onEdit,
                      labelText: 'Department',
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    MyTextField(
                      controller: _email,
                      obcureText: false,
                      keyBoardType: TextInputType.text,
                      isPassword: false,
                      isReadOnly: false,
                      labelText: 'Email',
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    MyTextField(
                      controller: _password,
                      obcureText: false,
                      keyBoardType: TextInputType.text,
                      isPassword: false,
                      isReadOnly: !onEdit,
                      labelText: 'Password',
                      sufixIcon: IconButton(
                        color: Colors.black54,
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: onEdit
                            ? () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }
                            : null,
                      ),
                    ),
                    // MyTextField(
                    //   validator: (pass) {
                    //     if (pass != _password.text) {
                    //       return 'Password Dont match';
                    //     }
                    //     return null;
                    //   },
                    //   controller: _password,
                    //   obcureText: false,
                    //   keyBoardType: TextInputType.text,
                    //   isPassword: false,
                    //   isReadOnly: !onEdit,
                    //   labelText: 'Confirm Password',
                    //   sufixIcon: IconButton(
                    //     color: Colors.black54,
                    //     icon: Icon(_isObscure1
                    //         ? Icons.visibility
                    //         : Icons.visibility_off),
                    //     onPressed: onEdit
                    //         ? () {
                    //             setState(
                    //               () {
                    //                 _isObscure1 = !_isObscure1;
                    //               },
                    //             );
                    //           }
                    //         : null,
                    //   ),
                    // )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
