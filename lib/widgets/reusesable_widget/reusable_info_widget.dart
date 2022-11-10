import 'package:flutter/material.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseableInfoWidget extends StatelessWidget {
  final String logo;
  final String maintext;
  final String detailsText;
  final String bottonText;
  final GestureTapCallback onPressed;


  const ReuseableInfoWidget(
      {Key? key,
      required this.logo,
      required this.maintext,
      required this.detailsText,
      required this.bottonText,
      required this.onPressed,
})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            SizedBox(
              height: 140.h,
              width: 140.w,
              child: Image.asset(
                logo,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            NormalText(
              text: maintext,
              size: 23.h,
              fontWeight: FontWeight.w600,
            ),
             SizedBox(
              height: 28.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 18.h , horizontal: 18.h),
              child: NormalText(text: detailsText, size: 14.sp, textAlign: TextAlign.center,),
            ),  SizedBox(
              height: 48.h,
            ),
            ReuseableButton(text: bottonText,textSize: 14, onPressed: onPressed),
          ],
        ),
      ),
    );
  }
}
