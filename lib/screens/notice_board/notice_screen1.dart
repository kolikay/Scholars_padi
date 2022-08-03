import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';

class NoticeScreen1 extends StatelessWidget {
  const NoticeScreen1({
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
      body: SingleChildScrollView(
        child: Container(
          height: 900.h,
          width: double.infinity,
          color: AppColor.darkContainer,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24.0.w),
                child: SizedBox(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NormalText(
                            text: 'Sources',
                            fontWeight: FontWeight.bold,
                            size: 19.2.sp,
                          ),
                          NormalText(
                            text: 'View all >',
                            size: 14.sp,
                            color: AppColor.dullerBlack,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 110.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.53.w),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('lib/assets/matImage1.png'),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 40,
                                left: 20,
                                child: NormalText(
                                  text: 'School\nManagement',
                                  size: 12.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 110.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.53.w),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('lib/assets/matImage1.png'),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 40,
                                left: 20,
                                child: NormalText(
                                  text: 'Faculty of\nScience',
                                  size: 12.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 110.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.53.w),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('lib/assets/matImage1.png'),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 40,
                                left: 20,
                                child: NormalText(
                                  text: 'Faculty of\nPharmacy',
                                  size: 12.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 12.0.w,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 48.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: NormalText(
                          text: 'Latest News',
                          size: 19.2.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Card(
                          imgUrl: 'lib/assets/matImage2.png',
                          cardDate: '22/7/2022',
                          cardText:
                              '2021/2022 Undergraduate Students Accommodation For OAU Students',
                          cardTitle: 'School Management'),
                      SizedBox(
                        height: 20.h,
                      ),
                        Card(
                          imgUrl: 'lib/assets/matImage1.png',
                          cardDate: '22/2/2022',
                          cardText:
                              '2021/2022 Undergraduate Students Accommodation For OAU Students',
                          cardTitle: 'Faculty of Science'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Card(
      {required String imgUrl,
      required String cardDate,
      required String cardText,
      required String cardTitle}) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w, left: 12.w),
      child: Container(
        width: 327.w,
        height: 290.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 128.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    5.53.w,
                  ),
                  topLeft: Radius.circular(
                    5.53.w,
                  ),
                ),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('lib/assets/matImage2.png'),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: const Color.fromARGB(255, 168, 255, 230),
                    ),
                    width: 157.w,
                    height: 24.h,
                    child: Center(
                      child: NormalText(
                        text: 'School Management',
                        size: 12.sp,
                        color: const Color(0xff00CC92),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  NormalText(
                    text: '22/7/2022',
                    size: 12.sp,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: NormalText(
                text:
                    '2021/2022 Undergraduate Students Accommodation For OAU Students',
                size: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: NormalText(
                text: 'Read More...',
                size: 14.sp,
                color: const Color(0xff00CC92),
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
