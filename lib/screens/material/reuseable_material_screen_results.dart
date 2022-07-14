import 'package:flutter/material.dart';
import 'package:scholars_padi/widgets/reusesable_widget/new_reusable_app_bar.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseableMaterialScreenResults extends StatelessWidget {
  final String appBarTitle;
  final String message;
  final String cardMessage1;

  final String cardMessage2;

  final String cardMessage3;

  final String? cardMessage4;

  final String? cardMessage5;

  final GestureTapCallback onPressed;

  const ReuseableMaterialScreenResults({
    Key? key,
    required this.appBarTitle,
    required this.message,
    required this.cardMessage1,
    required this.cardMessage2,
    required this.cardMessage3,
    this.cardMessage4,
    this.cardMessage5,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: NewReuseableAppBar(
          title: NormalText(
            text: appBarTitle,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          firstAppIcon: IconButton(
            onPressed: () {},
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
                  text: message, fontWeight: FontWeight.w500, size: 16.sp, color: Colors.black54,),
              SizedBox(
                height: 24.h,
              ),
              MaterialCards(cardMessage: cardMessage1, onPressed: onPressed),
              SizedBox(
                height: 16.h,
              ),
              MaterialCards(cardMessage: cardMessage2, onPressed: onPressed),
              SizedBox(
                height: 16.h,
              ),
              MaterialCards(cardMessage: cardMessage3, onPressed: onPressed),
              SizedBox(
                height: 16.h,
              ),
              MaterialCards(cardMessage: cardMessage4!, onPressed: onPressed),
              SizedBox(
                height: 16.h,
              ),
              MaterialCards(cardMessage: cardMessage5!, onPressed: onPressed),
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
    return Container(
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
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.black54,),
          ),
        ],
      ),
    );
  }
}
