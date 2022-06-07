import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final images = [
    'lib/assets/landingImage1.png',
    'lib/assets/landingImage2.png',
    'lib/assets/landingImage3.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 24),
          child: CarouselSlider.builder(
            options: CarouselOptions(height: 400),
            itemCount: images.length,
            itemBuilder: (context, index, realIndex) {
              final Image = images[index];
              return buildImage(Image, index);
            },
          ),
        ),
      ),
    );
  }

  Widget buildImage(String image, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12),
    );
  }
}
