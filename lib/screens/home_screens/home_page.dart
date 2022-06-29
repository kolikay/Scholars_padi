import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_appbar.dart';
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
        body: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.start,
          child: Container(
            color: AppColor.darkContainer,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                ReuseableAppbar(
                  menuPressed: () {},
                  searchPressed: () {},
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       GestureDetector(
                //         onTap: () {},
                //         child: const Icon(Icons.menu, size: 30.0),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: const Icon(Icons.search, size: 30.0),
                //       ),
                //     ],
                //   ),
                // ),
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
                const SizedBox(height: 5),
                buildIndicator(),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      const Divider(
                        color: Colors.black26,
                        thickness: 2.0,
                      ),
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
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GridView.count(
                            primary: false,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                            crossAxisCount: 4,
                            children: <Widget>[
                              newInkwell(
                                  context, 'Material', 'lib/assets/home1.png'),
                              newInkwell(context, 'Past Question',
                                  'lib/assets/home2.png'),
                              newInkwell(
                                  context, 'Scheduler', 'lib/assets/home3.png'),
                              newInkwell(
                                  context, 'Note Book', 'lib/assets/home4.png'),
                              newInkwell(context, 'Scholarships',
                                  'lib/assets/home5.png'),
                              newInkwell(context, 'Notice Boards',
                                  'lib/assets/home6.png'),
                              newInkwell(
                                  context, 'Chats', 'lib/assets/home7.png'),
                              newInkwell(
                                  context, 'More', 'lib/assets/home8.png'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(
                        color: Colors.black26,
                        thickness: 2.0,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          NormalText(
                            text: 'Recent Activities',
                            size: 19.2,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      const ReuseableCards(
                        date: 'jan',
                        note:
                            'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj',
                      ),
                     const ReuseableCards(
                        date: 'jan',
                        note:
                            'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj',
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
          dotColor: Colors.black12),
    );
  }

  InkWell newInkwell(BuildContext context, String label, String imgUrl) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ResizeImage(AssetImage(imgUrl), height: 30, width: 30),
                ),
              ),
            ),
            NormalText(
              text: label,
              size: 10,
            )
          ],
        ),
      ),
    );
  }
}

class ReuseableCards extends StatelessWidget {
  final String date;
  final String note;

  const ReuseableCards({
    Key? key,
    required this.date,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: 343,
        height: 83,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NormalText(
                        text:
                            // '2021/2011 Undergraduate students \nAccomodations for OAU Students',
                            note,
                        size: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  NormalText(
                    text: date,
                    size: 12,
                    color: AppColor.dullBlack,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
