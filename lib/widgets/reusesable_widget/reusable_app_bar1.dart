import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';

class ReuseableAppBar1 extends StatelessWidget {
  final IconButton firstAppIcon;
  final IconButton secondAppIcon;
  final NormalText? title;
  const ReuseableAppBar1(
      {Key? key,
      required this.firstAppIcon,
      required this.secondAppIcon,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: EdgeInsets.only(top: 20.0.h),
        child: title,
      ),
      toolbarHeight: 103.h,
      backgroundColor: AppColor.mainColor,
      leading: Center(
        child:
            Padding(padding: EdgeInsets.only(top: 20.0.h), child: firstAppIcon),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(top: 20.0.h),
          child: secondAppIcon,
        )
      ],
    );
  }
}