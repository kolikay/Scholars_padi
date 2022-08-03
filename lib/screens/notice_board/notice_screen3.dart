import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';

class NoticeScreen3 extends StatelessWidget {
  const NoticeScreen3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReuseableAppBar1(
          title: NormalText(
            text: 'Notice Board',
            color: Colors.white,
          ),
          firstAppIcon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          secondAppIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Container(
              width: 327.w,
              height: 178.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.53.w),
                image: const DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('lib/assets/matImage1.png'),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            NormalText(
              text:
                  'Notice to Faculty of Science students staying in all hall of residences',
              size: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 10.h,
            ),
            NormalText(
              text: '2 Days ago',
              size: 12.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.dullerBlack,
            ),
            const Divider(
              color: AppColor.dullerBlack,
              thickness: 0.5,
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 215.h,
              width: 327.w,
              child: NormalText(
                  text:
                      'As a result of the ongoing protest, the management of Obafemi Awolowo University give order to all students in the school to vacate all of residences and this was due to the school that was shut down as a result of the ongoing protest. Therefore, the Dean of Faculty of Science told all final year students to find a place to stay in off campus so as to able to complete their Project Defence and also other important task that is very necessary for their final year success.'
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
