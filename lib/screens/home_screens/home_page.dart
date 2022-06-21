import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/normal_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);
  static const String id = 'homepage_screen';

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int activeImageIndex = 0;

  List<String> images = [
    'lib/assets/homepageimage.png',
    'lib/assets/homepageimage.png',
    'lib/assets/homepageimage.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: AppColor.darkContainer,
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.menu, size: 30.0),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.search, size: 30.0),
                        ),
                      ],
                    ),
                  ),
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      // enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      // autoPlay: true,

                      onPageChanged: (index, reason) =>
                          setState(() => activeImageIndex = index),
                      autoPlayInterval: const Duration(seconds: 2),
                    ),
                    itemCount: images.length,
                    itemBuilder: (context, index, realIndex) {
                      final image = images[index];
                      return buildImage(image, index);
                    },
                  ),
                  const SizedBox(height: 10),
                  buildIndicator(),
                  const SizedBox(height: 10),
                  const Divider(
                    color: Colors.black26,
                    thickness: 2.0,
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            NormalText(
                              text: 'Categories',
                              size: 19.2,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: 343,
                          height: 176,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [Row(
                              children: [],
                            ), Row(
                              children: [],
                            )],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String image, int index) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
        ),
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
        activeIndex: activeImageIndex,
        count: images.length,
        effect: const WormEffect(
            dotWidth: 8.0,
            dotHeight: 8.0,
            activeDotColor: AppColor.dullBlack,
            dotColor: Colors.black12));
  }
}
