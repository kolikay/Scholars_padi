import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget materialfavScreen() {
  return SizedBox(
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 15.h,
      ),
      NormalText(
        text: 'Materials',
        fontWeight: FontWeight.bold,
        size: 19.2.sp,
        color: AppColor.mainColor,
      ),
      SizedBox(
        height: 15.h,
      ),
      const MaterialCards(
        cardMessage: 'Fundamental University Physical Chemistry',
      ),
      SizedBox(
        height: 15.h,
      ),
      const MaterialCards(
        cardMessage: 'Gates Cambridges Scholarship Fund For Students',
      ),
      SizedBox(
        height: 15.h,
      ),
      const MaterialCards(
        cardMessage:
            'Total/SNEPCO Scholarship Fund For Undergraduates Students',
      ),
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
      height: 179.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.53.w),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        children: [
          Container(
            width: 327.w,
            height: 95.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.w),
                  bottomLeft: Radius.circular(5.w)),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/matImage1.png'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(9.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 235.w,
                          child: NormalText(
                            text: cardMessage,
                            color: Colors.black,
                            size: 14.sp,
                          ),
                        ),
                        const Icon(Icons.more_vert)
                      ],
                    ),
                    NormalText(
                      text: '22/7/2022',
                      size: 12.sp,
                      color: AppColor.dullBlack,
                    )
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
