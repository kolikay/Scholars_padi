// ignore_for_file: must_be_immutable

import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/screens/on_boarding/home_screens/categories_page.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeConstants {
  static int activeImageIndex = 0;

  static List<String> images = [
    'lib/assets/homepageimage.png',
    'lib/assets/homepageimage.png',
    'lib/assets/homepageimage.png',
  ];

  static Widget buildImage(String image, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
        ),
      ),
    );
  }

  static Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeImageIndex,
      count: images.length,
      effect: WormEffect(
          dotWidth: 8.0.w,
          dotHeight: 8.0.h,
          activeDotColor: AppColor.dullBlack,
          dotColor: Colors.black12),
    );
  }

  static InkWell newInkwell(BuildContext context, String label, String imgUrl) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const CategoriesPage(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 40.h,
              width: 40.w,
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
              size: 10.sp,
            ),
          ],
        ),
      ),
    );
  }

  static InkWell categoryCard(
      BuildContext context, String label, String imgUrl) {
    return InkWell(
      child: Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          Card(
            color: Colors.white,
            elevation: 10,
            child: SizedBox(
              width: 100.w,
              height: 90.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: ResizeImage(AssetImage(imgUrl),
                            height: 30, width: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  NormalText(
                    text: label,
                    size: 10.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerIcons extends StatefulWidget {
  final IconData icon;
  final String imageName;
  final GestureTapCallback? onPressed;

  const DrawerIcons({
    Key? key,
    required this.icon,
    required this.imageName,
    this.onPressed
  }) : super(key: key);

  @override
  State<DrawerIcons> createState() => _DrawerIconsState();
}

class _DrawerIconsState extends State<DrawerIcons> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: const Color(0xffC4C4C4),
        splashColor: const Color(0xffC4C4C4),
        onTap: widget.onPressed,
        child: SizedBox(
          height: 46.h,
          child: Row(
            children: [
              SizedBox(
                width: 24.w,
              ),
              Icon(
                widget.icon,
                size: 30.w,
                // color: AppColor.iconBlack,
              ),
              SizedBox(
                width: 20.w,
              ),
              NormalText(
                text: widget.imageName,
                size: 16.sp,
                // color: AppColor.dullBlack,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
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
      padding: EdgeInsets.symmetric(vertical: 10.0.h),
      child: Container(
        width: 343.w,
        height: 83.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NormalText(
                        text: note,
                        size: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      Container(
                        height: 10.h,
                        width: 10.w,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  NormalText(
                    text: date,
                    size: 12.sp,
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
