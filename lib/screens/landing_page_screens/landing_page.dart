import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late PageController pageController;
  int currentPage = 0;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();

    pageController =
        PageController(initialPage: currentPage, viewportFraction: 0.9.w);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            children: [
              buildPage(
                  color: Colors.white10,
                  urlImage: 'lib/assets/landingImage1.png',
                  title: 'Library Accessibility',
                  subTitle1: 'Materials of all classes are made',
                  subTitle2: ' available and note can be jot',
                  subTitle3: ' down for personal uses'),
              buildPage(
                  color: Colors.white,
                  urlImage: 'lib/assets/landingImage2.png',
                  title: 'Activity Reminder',
                  subTitle1: 'Reminders are used to reduce the ',
                  subTitle2: 'rate of forgetfulnessof students'),
              buildPage(
                  color: Colors.white,
                  urlImage: 'lib/assets/landingImage3.png',
                  title: 'Latest Information',
                  subTitle1: 'Latest new on campus and',
                  subTitle2: 'scholarship aids can be accessed',
                  subTitle3: 'easily'),
            ],
          ),
        ),
        bottomSheet: !isLastPage
            ? SizedBox(
                height: 70.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        pageController.jumpToPage(2);
                      },
                      child: NormalText(
                        text: 'Skip',
                        size: 14.sp,
                        color: AppColor.mainColor,
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: WormEffect(
                            dotWidth: 10.w,
                            dotHeight: 10.h,
                            activeDotColor: AppColor.mainColor,
                            dotColor: Colors.black12),
                        onDotClicked: (index) => pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut),
                      ),
                    ),
                    ReuseableButton(
                      height: 55.h,
                      width: 55.w,
                      text: '>',
                      textSize: 30.sp,
                      onPressed: () {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut);
                      },
                    )
                  ],
                ),
              )
            : SizedBox(
                height: 70.h,
                child: Center(
                  child: Column(
                    children: [
                      ReuseableButton(
                        height: 45.h,
                        text: 'Get Started',
                        onPressed: () {
                          pushToLoginPage(context);
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: WormEffect(
                            dotWidth: 10.w,
                            dotHeight: 10.h,
                            activeDotColor: AppColor.mainColor,
                            dotColor: Colors.black12),
                        onDotClicked: (index) => pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subTitle1,
    required String subTitle2,
    String subTitle3 = '',
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 425.h,
              width: 302.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                image: DecorationImage(
                    image: AssetImage(urlImage), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            NormalText(
              text: title,
              size: 19.2.sp,
              color: AppColor.mainColor,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 7.h,
            ),
            NormalText(
              text: subTitle1,
              size: 16.sp,
              color: Colors.black54,
            ),
            SizedBox(
              height: 7.h,
            ),
            NormalText(
              text: subTitle2,
              size: 16.sp,
              color: Colors.black54,
            ),
            SizedBox(
              height: 7.h,
            ),
            NormalText(
              text: subTitle3,
              size: 16.sp,
              color: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}
