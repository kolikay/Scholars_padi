import 'package:flutter/material.dart';
import 'package:scholars_padi/screens/notice_board/notice_screen3.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';

class NoticeScreen2 extends StatelessWidget {
  const NoticeScreen2({
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 24.h,),
              const MaterialCards(
                  cardMessage:
                      'Notice to Faculty of Science students staying in all hall of residences'),
              SizedBox(
                height: 20.h,
              ),
              const MaterialCards(
                  cardMessage:
                      'Faculty of Science students staying in hall of residences should not be five in a room'),
              SizedBox(
                height: 20.h,
              ),
              const MaterialCards(
                  cardMessage:
                      'Notice to Faculty of Science students staying in all hall of residences'),
            ],
          ),
        ));
  }
}

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
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => const NoticeScreen3()),
            ),
          );
        },
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
      ),
    );
  }
}
