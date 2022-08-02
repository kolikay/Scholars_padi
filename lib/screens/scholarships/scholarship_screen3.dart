import 'package:flutter/material.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget scholarshipScreen3() {
  return SizedBox(
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 15.h,
      ),
      NormalText(
        text: '8 results',
        fontWeight: FontWeight.bold,
        size: 19.2.sp,
      ),
      SizedBox(
        height: 15.h,
      ),
      const MaterialCards(
        cardMessage: 'Nigeria',
      ),
      SizedBox(
        height: 15.h,
      ),
      const MaterialCards(
        cardMessage:
            'Canada',
      ),
      SizedBox(
        height: 15.h,
      ),
      const MaterialCards(
        cardMessage:
            'South Africa',
      ),
      SizedBox(
        height: 15.h,
      ),
      const MaterialCards(
        cardMessage:
            'UAE',
      ),
      SizedBox(
        height: 15.h,
      ),
      const MaterialCards(
        cardMessage: 'United Kingdom',
      ),
        SizedBox(
        height: 15.h,
      ),
      const MaterialCards(
        cardMessage: 'India',
      ),
        SizedBox(
        height: 15.h,
      ),
      const MaterialCards(
        cardMessage: 'Korea',
      ),
          SizedBox(
        height: 15.h,
      ),
      const MaterialCards(
        cardMessage: 'United States Of America',
      )
    ]),
  );
}

// informations cards
class MaterialCards extends StatelessWidget {
  const MaterialCards({
    Key? key,
    required this.cardMessage,
  }) : super(key: key);

  final String cardMessage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50.h,
        width: 327.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black12)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: NormalText(
            text: cardMessage,
            fontWeight: FontWeight.w500,
            size: 16.sp,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
