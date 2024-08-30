
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/screens/authentication/views/login_screen.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landing Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late PageController _pageController;
  int _currentPage = 0;
  bool _isLastPage = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _startAutoSlide();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    Future.delayed(Duration(seconds: 3)).then((_) {
      if (_pageController.page!.toInt() < 2) {
        _pageController.nextPage(
            duration: Duration(milliseconds: 5000), curve: Curves.easeIn);
        _startAutoSlide();
      }
    });
  }

  void _skipToNextPage() {
    if (_pageController.page!.toInt() < 2) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _isLastPage = index == 2;
            });
          },
          children: [
            buildPage(
                color: Colors.white10,
                urlImage: 'assets/images/landingImage1.png',
                title: 'Library Accessibility',
                subTitle1: 'Materials of all classes are made',
                subTitle2: ' available and note can be jot',
                subTitle3: ' down for personal uses'),
            buildPage(
                color: Colors.white,
                urlImage: 'assets/images/landingImage2NOW.jpg',
                title: 'Activity Reminder',
                subTitle1: 'Reminders are used to reduce the ',
                subTitle2: 'rate of forgetfulnessof students'),
            buildPage(
                color: Colors.white,
                urlImage: 'assets/images/landingImage3NOW.jpg',
                title: 'Latest Information',
                subTitle1: 'Latest new on campus and',
                subTitle2: 'scholarship aids can be accessed',
                subTitle3: 'easily'),
          ],
        ),
      ]),
      bottomSheet: !_isLastPage
          ? SizedBox(
              height: 70.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                      // pageController.jumpToPage(2);
                    },
                    child: NormalText(
                      text: 'Skip',
                      size: 14.sp,
                      color: AppColor.mainColor,
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: WormEffect(
                          dotWidth: 10.w,
                          dotHeight: 10.h,
                          activeDotColor: AppColor.mainColor,
                          dotColor: Colors.black12),
                      onDotClicked: (index) => _pageController.animateToPage(
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
                      _pageController.nextPage(
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
                      controller: _pageController,
                      count: 3,
                      effect: WormEffect(
                          dotWidth: 10.w,
                          dotHeight: 10.h,
                          activeDotColor: AppColor.mainColor,
                          dotColor: Colors.black12),
                      onDotClicked: (index) => _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String description,
  }) {
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              height: 300,
            ),
            SizedBox(height: 30),
            Text(
              title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade700,
              ),
            ),
            SizedBox(height: 20),
            Text(
              description,
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue.shade700,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
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



// import 'package:flutter/material.dart';
// import 'package:scholars_padi/constants/appColor.dart';
// import 'package:scholars_padi/routes/page_routes.dart';
// import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
// import 'package:scholars_padi/widgets/reusesable_widget/reuseable_button.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../authentication/views/login_screen.dart';

// class LandingPage extends StatefulWidget {
//   const LandingPage({Key? key}) : super(key: key);

//   @override
//   State<LandingPage> createState() => _LandingPageState();
// }

// class _LandingPageState extends State<LandingPage> {
//   late PageController pageController;
//   int currentPage = 0;
//   bool isLastPage = false;

//   @override
//   void initState() {
//     pageController =
//         PageController(initialPage: currentPage, viewportFraction: 0.9.w);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     pageController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SizedBox(
//           child: PageView(
//              controller: pageController,
//             onPageChanged: (index) {
//               setState(() {
//                 isLastPage = index == 2;
//               });
//             },
//             children: [
//               buildPage(
//                   color: Colors.white10,
//                   urlImage: 'assets/images/landingImage1.png',
//                   title: 'Library Accessibility',
//                   subTitle1: 'Materials of all classes are made',
//                   subTitle2: ' available and note can be jot',
//                   subTitle3: ' down for personal uses'),
//               buildPage(
//                   color: Colors.white,
//                   urlImage: 'assets/images/landingImage2NOW.jpg',
//                   title: 'Activity Reminder',
//                   subTitle1: 'Reminders are used to reduce the ',
//                   subTitle2: 'rate of forgetfulnessof students'),
//               buildPage(
//                   color: Colors.white,
//                   urlImage: 'assets/images/landingImage3NOW.jpg',
//                   title: 'Latest Information',
//                   subTitle1: 'Latest new on campus and',
//                   subTitle2: 'scholarship aids can be accessed',
//                   subTitle3: 'easily'),
//             ],
//           ),
//         ),
//         bottomSheet: !isLastPage
//             ? SizedBox(
//                 height: 70.h,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => const LoginScreen(),
//                           ),
//                         );
//                         // pageController.jumpToPage(2);
//                       },
//                       child: NormalText(
//                         text: 'Skip',
//                         size: 14.sp,
//                         color: AppColor.mainColor,
//                       ),
//                     ),
//                     Center(
//                       child: SmoothPageIndicator(
//                         controller: pageController,
//                         count: 3,
//                         effect: WormEffect(
//                             dotWidth: 10.w,
//                             dotHeight: 10.h,
//                             activeDotColor: AppColor.mainColor,
//                             dotColor: Colors.black12),
//                         onDotClicked: (index) => pageController.animateToPage(
//                             index,
//                             duration: const Duration(milliseconds: 500),
//                             curve: Curves.easeOut),
//                       ),
//                     ),
//                     ReuseableButton(
//                       height: 55.h,
//                       width: 55.w,
//                       text: '>',
//                       textSize: 30.sp,
//                       onPressed: () {
//                         pageController.nextPage(
//                             duration: const Duration(milliseconds: 500),
//                             curve: Curves.easeOut);
//                       },
//                     )
//                   ],
//                 ),
//               )
//             : SizedBox(
//                 height: 70.h,
//                 child: Center(
//                   child: Column(
//                     children: [
//                       ReuseableButton(
//                         height: 45.h,
//                         text: 'Get Started',
//                         onPressed: () {
//                           pushToLoginPage(context);
//                         },
//                       ),
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       SmoothPageIndicator(
//                         controller: pageController,
//                         count: 3,
//                         effect: WormEffect(
//                             dotWidth: 10.w,
//                             dotHeight: 10.h,
//                             activeDotColor: AppColor.mainColor,
//                             dotColor: Colors.black12),
//                         onDotClicked: (index) => pageController.animateToPage(
//                             index,
//                             duration: const Duration(milliseconds: 500),
//                             curve: Curves.easeOut),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//       ),
//     );
//   }

//   Widget buildPage({
//     required Color color,
//     required String urlImage,
//     required String title,
//     required String subTitle1,
//     required String subTitle2,
//     String subTitle3 = '',
//   }) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
//       child: Container(
//         color: color,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: 425.h,
//               width: 302.w,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5.r),
//                 image: DecorationImage(
//                     image: AssetImage(urlImage), fit: BoxFit.cover),
//               ),
//             ),
//             SizedBox(
//               height: 25.h,
//             ),
//             NormalText(
//               text: title,
//               size: 19.2.sp,
//               color: AppColor.mainColor,
//               fontWeight: FontWeight.w600,
//             ),
//             SizedBox(
//               height: 7.h,
//             ),
//             NormalText(
//               text: subTitle1,
//               size: 16.sp,
//               color: Colors.black54,
//             ),
//             SizedBox(
//               height: 7.h,
//             ),
//             NormalText(
//               text: subTitle2,
//               size: 16.sp,
//               color: Colors.black54,
//             ),
//             SizedBox(
//               height: 7.h,
//             ),
//             NormalText(
//               text: subTitle3,
//               size: 16.sp,
//               color: Colors.black54,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
