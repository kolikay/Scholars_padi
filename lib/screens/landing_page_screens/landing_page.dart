import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/screens/auth_screens/login_screen.dart';
import 'package:scholars_padi/widgets/normal_text.dart';
import 'package:scholars_padi/widgets/reuseable_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
        PageController(initialPage: currentPage, viewportFraction: 0.9);
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
                  subTitle:
                      'Materials of all classes are made available and note can be jotted down for personal uses'),
              buildPage(
                  color: Colors.white,
                  urlImage: 'lib/assets/landingImage2.png',
                  title: 'Activity Reminder',
                  subTitle:
                      'Reminders are used to reduce the rate of forgetfulnessof students'),
              buildPage(
                  color: Colors.white,
                  urlImage: 'lib/assets/landingImage3.png',
                  title: 'Latest Information',
                  subTitle:
                      'Latest new on campus and scholarship aids can be accessed easily'),
            ],
          ),
        ),
        bottomSheet: !isLastPage
            ? SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        pageController.jumpToPage(2);
                      },
                      child: NormalText(
                        text: 'Skip',
                        size: 14,
                        color: AppColor.mainColor,
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: const WormEffect(
                            dotWidth: 10,
                            dotHeight: 10,
                            activeDotColor: AppColor.mainColor,
                            dotColor: Colors.black12),
                        onDotClicked: (index) => pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut),
                      ),
                    ),
                    ReuseableButton(
                      height: 55,
                      width: 55,
                      text: '>',
                      textSize: 30,
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
                height: 70,
                child: Center(
                  child: Column(
                    children: [
                      ReuseableButton(
                        text: 'Get Started',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: const WormEffect(
                            dotWidth: 10,
                            dotHeight: 10,
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
    required String subTitle,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: color,
        child: Column(
          children: [
            Container(
              height: 425,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage(urlImage), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            NormalText(
              text: title,
              size: 19.2,
              color: AppColor.mainColor,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: NormalText(
                text: subTitle,
                size: 16,
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
    );
  }
}
