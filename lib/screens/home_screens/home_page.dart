import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
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
    'lib/assets/logo.png',
     'lib/assets/logo.png',
      'lib/assets/logo.png',
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  height: 400,
                  autoPlay: true,
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
              buildIndicator(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImage(String image, int index) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
        activeIndex: activeImageIndex,
        count: images.length,
        effect: const WormEffect(
            dotWidth: 20,
            dotHeight: 20,
            activeDotColor: AppColor.mainColor,
            dotColor: Colors.black12));
  }
}
