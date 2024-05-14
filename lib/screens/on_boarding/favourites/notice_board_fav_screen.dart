import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget noticeboardfavScreen() {
  return SizedBox(
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 15.h,
      ),
      NormalText(
        text: 'Notice Board',
        fontWeight: FontWeight.bold,
        size: 19.2.sp,
        color: AppColor.mainColor,
      ),
      SizedBox(
        height: 15.h,
      ),
      const MaterialCards(
          cardMessage:
              'Notice to Faculty of Science students staying in all hall of residences'),
      SizedBox(
        height: 15.h,
      ),
      const MaterialCards(
          cardMessage:
              'Faculty of Science students staying in hall of residences should not be five in a room'),
      SizedBox(
        height: 15.h,
      ),
      const MaterialCards(
          cardMessage:
              'Notice to Faculty of Science students staying in all hall of residences'),
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
    return Container(
      width: 327,
      height: 85.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.53.w),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Container(
            width: 104.w,
            height: 85.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.w),
                  bottomLeft: Radius.circular(5.w)),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('lib/assets/matImage1.png'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(10.0.w),
                child: NormalText(
                  text: cardMessage,
                  color: Colors.black,
                  size: 14.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
