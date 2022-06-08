import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/normal_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late PageController pageController;
  int currentPage = 0;

  // int activeImageIndex = 0;
  // int activeTextIndex = 0;
  // final images = [
  //   'lib/assets/landingImage1.png',
  //   'lib/assets/landingImage2.png',
  //   'lib/assets/landingImage3.png',
  // ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController =
        PageController(initialPage: currentPage, viewportFraction: 0.9);
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
            children: [
              buildPage(
                  color: Colors.white,
                  urlImage: 'lib/assets/landingImage1.png',
                  title: 'Library accesability',
                  subTitle:
                      'Provides material needed for the whole payments platform'),
              buildPage(
                  color: Colors.white,
                  urlImage: 'lib/assets/landingImage2.png',
                  title: 'Activity Reminger',
                  subTitle:
                      'Provides material needed for the whole payments platform'),
              buildPage(
                  color: Colors.white,
                  urlImage: 'lib/assets/landingImage3.png',
                  title: 'LAtest Infomation',
                  subTitle:
                      'Provides material needed for the whole payments platform'),
            ],
          ),
        ),
        bottomSheet: Container(
          height: 70,
          // padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  pageController.jumpToPage(2);
                },
                child: const Text('Skipp'),
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
                  onDotClicked: (index) => pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut),
                ),
              ),
              TextButton(
                onPressed: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut);
                },
                child: const Text('Next'),
              ),
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
      padding: EdgeInsets.all(10),
      child: Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
    
            // Image.asset(
            //   urlImage,
            //   fit: BoxFit.cover,
            //   width: double.infinity,
            // ),
            const SizedBox(
              height: 34,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
              child: Text(
                subTitle,
                style: const TextStyle(color: Colors.amber),
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

Widget buildImage(String image, int index) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
    ),
  );
}

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
