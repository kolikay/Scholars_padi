import 'package:flutter/material.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseableMaterialScreenList extends StatelessWidget {
  final String appBarTitle;
  final String message;
  final Widget materialCard1;
  final Widget materialCard2;
  final Widget materialCard3;
  final Widget materialCard4;
  final Widget materialCard5;

  const ReuseableMaterialScreenList({
    Key? key,
    required this.appBarTitle,
    required this.message,
    required this.materialCard1,
    required this.materialCard2,
    required this.materialCard3,
    this.materialCard4 = const SizedBox(),
    this.materialCard5 = const SizedBox(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReuseableAppBar1(
          title: NormalText(
            text: appBarTitle,
            color: Colors.white,
            fontWeight: FontWeight.w500,
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
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              NormalText(
                text: message,
                fontWeight: FontWeight.bold,
                size: 16.sp,
                color: Colors.black54,
              ),
              SizedBox(
                height: 24.h,
              ),
              materialCard1,
              SizedBox(
                height: 16.h,
              ),
              materialCard2,
              SizedBox(
                height: 16.h,
              ),
              materialCard3,
              SizedBox(
                height: 16.h,
              ),
              materialCard4,
              SizedBox(
                height: 16.h,
              ),
              materialCard5,
            ]),
      ),
    ));
  }
}

class MaterialCards extends StatelessWidget {
  const MaterialCards({
    Key? key,
    required this.cardMessage,
    required this.onPressed,
  }) : super(key: key);

  final String cardMessage;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: NormalText(
                text: cardMessage,
                fontWeight: FontWeight.w500,
                size: 16.sp,
                color: Colors.black54,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
