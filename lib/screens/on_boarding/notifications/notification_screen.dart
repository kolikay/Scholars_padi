import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(103.h),
          child: ReuseableAppBar1(
            title: NormalText(
              text: 'Notifications',
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
          padding: EdgeInsets.all(24.0.h),
          child: Column(
            children: [
              // const MaterialCards(),
              // SizedBox(
              //   height: 24.h,
              // ),
              // const MaterialCards(),
              // SizedBox(
              //   height: 24.h,
              // ),
              // const MaterialCards(),
            ],
          ),
        ));
  }
}

class MaterialCards extends StatelessWidget {
   final String cardMessage;
    final String cardTitle;
     final String cardDate;
      final String cardTime;
  const MaterialCards({
    Key? key,
    required this.cardMessage,
    required this.cardDate,
    required this.cardTime,
    required this.cardTitle
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 145.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.53.w),
          border: Border.all(color: Colors.black12),
          color: const Color(0xffb580ff)),
      child: Padding(
        padding: EdgeInsets.all(10.0.w),
        child: InkWell(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 222.w,
                    height: 45.h,
                    child: NormalText(
                      text: cardTitle,
                      size: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  NormalText(
                    text: cardDate,
                    size: 12.sp,
                    color: AppColor.dullerBlack,
                  ),
                ],
              ),
              SizedBox(
                height: 58.h,
                width: 327.w,
                child: NormalText(
                  text: cardMessage,
                  size: 12.sp,
                  color: AppColor.dullBlack,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100.w,
                  ),
                  NormalText(
                    text: cardTime,
                    size: 11.sp,
                    color: AppColor.dullerBlack,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
