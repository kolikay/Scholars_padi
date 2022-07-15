import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusaable_textformfield.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_button.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusesable_appBar2.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReusesableAppBar2(
          appBarTitle: 'Feedback',
          firstButton: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Container(
        color: AppColor.darkContainer,
        height: 800.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              NormalText(
                text:
                    'Have Feedback? We would love to hear it, but please don\'t share sensitive information.',
                fontWeight: FontWeight.w500,
                size: 16,
                color: AppColor.dullBlack,
              ),
              NormalText(
                text: 'For technical support, please Contact Us',
                fontWeight: FontWeight.w500,
                size: 16,
                color: AppColor.dullBlack,
              ),
              NormalText(
                text: 'Please enter your feedback here',
                fontWeight: FontWeight.w500,
                size: 16,
                color: AppColor.dullBlack,
              ),
              SizedBox(
                height: 24.h,
              ),
              TextField(
                maxLength: 300,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0.w),
                  ),
               
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              ReuseableButton(
                onPressed: () {},
                text: 'Submit',
              )
            ],
          ),
        ),
      ),
    );
  }
}
