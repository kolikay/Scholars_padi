import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: AppColor.darkContainer,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wifi_off_rounded,
                        size: 70.w,
                        color: AppColor.dullBlack,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      NormalText(
                        text: 'No Internet Connection',
                        size: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      NormalText(
                        text: 'You are offline, please check your connection',
                        color: AppColor.dullBlack,
                        size: 14.sp,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ReuseableButton(
                        text: 'Try Again',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        width: 140.w,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
