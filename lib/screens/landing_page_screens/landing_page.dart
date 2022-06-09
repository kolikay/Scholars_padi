import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/screens/auth_screens/sign_up1.dart';
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
        body: Container(
          padding: const EdgeInsets.only(bottom: 70),
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            children: [
              buildPage(
                  color: Colors.white,
                  urlImage: 'lib/assets/landingImage1.png',
                  title: 'Library Accessaibility',
                  subTitle:
                      'Materials of all classes are made available and note can be jotted down for personal uses'),
              buildPage(
                  color: Colors.white,
                  urlImage: 'lib/assets/landingImage2.png',
                  title: 'Activity Reminger',
                  subTitle:
                      'Reminders are used to reduce the rate of forgetfulnessof students'),
              buildPage(
                  color: Colors.white,
                  urlImage: 'lib/assets/landingImage3.png',
                  title: 'Latest Infomation',
                  subTitle:
                      'Latest new on camous and scholarship aids can be accessed easily'),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? ReuseableButton(
                text: 'Get Started',
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen1(),
                    ),
                  );
                },
              )
            : SizedBox(
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
                        color: AppColor.mainColor,
                      ),
                    ),
                    
                    Center(
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: const WormEffect(
                            dotWidth: 20,
                            dotHeight: 20,
                            activeDotColor: AppColor.mainColor,
                            dotColor: Colors.black12),
                        onDotClicked: (index) => pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ReuseableButton(
                        text: '>',
                        size: 30,
                        onPressed: () {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeOut);
                        },
                        width: 75,
                      ),
                    )
                  ],
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
      padding: const EdgeInsets.all(10),
      child: Container(
        color: color,
        child: Column(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(urlImage), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 20,
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
            SizedBox(
              child: NormalText(
                text: subTitle,
                textAlign: TextAlign.end,
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
    );
  }
}







//   Widget carousel() {
//     return CarouselSlider.builder(
//       options: CarouselOptions(
//           height: 400,
//           // autoPlay: true,
//           enlargeCenterPage: true,
//           autoPlayInterval: const Duration(seconds: 3),
//           onPageChanged: (index, reason) {
//             setState(() {
//               activeImageIndex = index;
//             });
//           }),
//       itemCount: images.length,
//       itemBuilder: (context, index, realIndex) {
//         final image = images[index];
//         return buildImage(image, index);
//       },
//     );
//   }

// Widget buildImage(String image, int index) {
//   return Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(20),
//       image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
//     ),
//   );
// }

//   Widget buildIndicator() {
//     return AnimatedSmoothIndicator(
//         activeIndex: activeImageIndex,
//         count: images.length,
//         effect: const WormEffect(
//             dotWidth: 20,
//             dotHeight: 20,
//             activeDotColor: AppColor.mainColor,
//             dotColor: Colors.black12));
//   }
// }
