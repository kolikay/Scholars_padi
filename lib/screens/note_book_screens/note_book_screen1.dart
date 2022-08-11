import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';

class NoteBookScreen1 extends StatelessWidget {
  const NoteBookScreen1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReuseableAppBar1(
          title: NormalText(
            text: 'NoteBook',
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
      body: Container(
        width: double.infinity,
        height: 812.h,
        color: AppColor.darkContainer,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: 120.h,
                //   width: 120.h,
                //   child: Icon(
                //     Icons.note_alt_outlined,
                //     size: 120.h,
                //     color: AppColor.dullerBlack,
                //   ),
                // ),
                // SizedBox(
                //   height: 20.h,
                // ),
                // NormalText(
                //   text: 'Make your life organized by recording daily notes',
                //   size: 16.sp,
                //   color: AppColor.dullerBlack,
                // ),
                SizedBox(
                  height: 15.h,
                ),
                const MaterialCards(
                  cardColor1: Colors.blue,
                  cardDate: 'March 13, 2022  08:53AM',
                  cardMessage: 'School Materials',
                  cardColor2: Color(0xffd1ecfa),
                ),
                SizedBox(
                  height: 15.h,
                ),
                const MaterialCards(
                  cardColor1: Colors.blue,
                  cardDate: 'March 13, 2022  08:53AM',
                  cardMessage: 'School Materials',
                  cardColor2: Color(0xffd1ecfa),
                ),
                SizedBox(
                  height: 15.h,
                ),
                const MaterialCards(
                  cardColor1: Colors.blue,
                  cardDate: 'March 13, 2022  08:53AM',
                  cardMessage: 'School Materials',
                  cardColor2: Color(0xffd1ecfa),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColor.mainColor,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 24.h,
          ),
        ),
      ),
    );
  }
}

class MaterialCards extends StatelessWidget {
  const MaterialCards({
    Key? key,
    required this.cardMessage,
    required this.cardDate,
    required this.cardColor1,
    required this.cardColor2,
  }) : super(key: key);

  final String cardMessage;
  final String cardDate;
  final Color cardColor1;
  final Color cardColor2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 80.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black12)),
      child: Row(
        children: [
          Container(
            width: 5,
            color: cardColor1,
          ),
          Expanded(
            child: Container(
              color: cardColor2,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(
                      text: cardMessage,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      size: 16.sp,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    NormalText(
                      text: cardDate,
                      color: AppColor.dullBlack,
                      size: 12.sp,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
