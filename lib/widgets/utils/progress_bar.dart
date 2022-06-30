import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProgressDialog extends StatelessWidget {
 final  String message;
   const ProgressDialog({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 70.h,
        margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0.r),
        ),
        child: Row(
          children: [
             SizedBox(width: 6.0.w),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColor.mainColor),
            ),
            SizedBox(
              width: 26.0.w,
            ),
            NormalText(text: message,color: AppColor.mainColor,size: 16.sp, )
          ],
        ),
      ),
    );
  }
}

  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return ProgressDialog(message: 'loading, please wait');
  //       });
