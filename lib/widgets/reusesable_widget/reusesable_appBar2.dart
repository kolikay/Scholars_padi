
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusesableAppBar2 extends StatelessWidget {
  final String appBarTitle;
  final IconButton firstButton;
  final IconButton? secondButton;

  const ReusesableAppBar2(
      {Key? key,
      required this.appBarTitle,
      required this.firstButton,
      this.secondButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: EdgeInsets.only(
          top: 10.0.h,
        ),
        child: NormalText(
          text: appBarTitle,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      toolbarHeight: 103.h,
      backgroundColor: AppColor.mainColor,
      leading: Center(
        child: Padding(
            padding: EdgeInsets.only(
              top: 10.0.h,
            ),
            child: firstButton),
      ),
      actions: [
        Padding(
            padding: EdgeInsets.only(top: 10.0.h, right: 10.w),
            child: secondButton)
      ],
    );
  }
}
