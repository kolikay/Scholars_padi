import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';

class MaterialCardScreen3 extends StatelessWidget {
  final GestureTapCallback onPressed1;
  final GestureTapCallback onPressed2;
  const MaterialCardScreen3({
    Key? key,
    required this.onPressed1,
    required this.onPressed2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReuseableAppBar1(
          title: NormalText(
            text: 'CHM 101',
            color: Colors.white,
          ),
          firstAppIcon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          secondAppIcon: IconButton(
            onPressed: () {
              pushCatergoriesSearchScreen(context);
            },
            icon: const Icon(Icons.search),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: AppColor.darkContainer,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
             InkWell(
                  onTap: onPressed1,
                  child: Container(
                    height: 176,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black12)),
                    child: Column(
                      children: [
                        Container(
                          child: const Icon(
                            Icons.book,
                            color: Colors.white,
                            size: 80,
                          ),
                          width: 327.w,
                          height: 130.h,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(5.53.w,), topLeft:Radius.circular(5.53.w,), ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        NormalText(
                          text: 'Materials',
                          fontWeight: FontWeight.bold,
                          size: 16,
                          color: AppColor.dullerBlack,
                        ),
                      ],
                    ),
                  ),),
              SizedBox(
                height: 32.h,
              ),
              InkWell(
                  onTap: onPressed2,
                  child: Container(
                    height: 176,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black12)),
                    child: Column(
                      children: [
                        Container(
                          child: const Icon(
                            Icons.question_mark_rounded,
                            color: Colors.white,
                            size: 80,
                          ),
                          width: 327.w,
                          height: 130.h,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(5.53.w,), topLeft:Radius.circular(5.53.w,), ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        NormalText(
                          text: 'Past Questions',
                          fontWeight: FontWeight.bold,
                          size: 16,
                          color: AppColor.dullerBlack,
                        ),
                      ],
                    ),
                  ),),
            ],
          ),
        ),
      ),
    );
  }
}
