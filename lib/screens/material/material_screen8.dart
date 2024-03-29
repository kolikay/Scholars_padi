// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/screens/material/material_screen9.dart';

import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_button.dart';

class MaterialScreen8 extends StatelessWidget {
  final String title;
  const MaterialScreen8({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReuseableAppBar1(
          title: NormalText(
            text: title,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          firstAppIcon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          secondAppIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              NormalText(
                text: 'View your preferred materials and text books',
                fontWeight: FontWeight.bold,
                size: 16.sp,
                color: Colors.black54,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      MaterialCards(),
                      MaterialCards(),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      MaterialCards(),
                      MaterialCards(),
                    ],
                  ),
                ],
              )
            ]),
      ),
    ));
  }
}

class MaterialCards extends StatefulWidget {
  bool isFav = false;
  MaterialCards({
    Key? key,
  }) : super(key: key);

  @override
  State<MaterialCards> createState() => _MaterialCardsState();
}

class _MaterialCardsState extends State<MaterialCards> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        bottomSheet(context);
      },
      child: Padding(
        padding: EdgeInsets.all(2.5.h),
        child: Container(
          width: 160.w,
          height: 220.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 160.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          5.53.w,
                        ),
                        topLeft: Radius.circular(
                          5.53.w,
                        ),
                      ),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('lib/assets/matImage2.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.isFav = !widget.isFav;
                        });
                      },
                      icon: Icon(
                        !widget.isFav
                            ? Icons.favorite_outline_sharp
                            : Icons.favorite,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0.w, right: 10.w),
                child: Column(
                  children: [
                    Text(
                      'Fundamental university',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NormalText(
                          text: '22/06/2022',
                          fontWeight: FontWeight.bold,
                          size: 10.sp,
                          color: Colors.black87,
                        ),
                        Icon(
                          Icons.more_vert,
                          size: 20.h,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
   bottomSheet(BuildContext context) async {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (builder) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColor.darkContainer,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: 364.h,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              NormalText(
                text: 'View your preferred Material and text book',
                fontWeight: FontWeight.w400,
                size: 14.sp,
                color: Colors.black,
              ),
              SizedBox(
                height: 10.h,
              ),
              NormalText(
                text: 'Text Book Name',
                fontWeight: FontWeight.w500,
                size: 16.sp,
              ),
              SizedBox(
                height: 10.h,
              ),
              NormalText(
                text: 'Fundamental University Physical Chemistry',
                fontWeight: FontWeight.w500,
                size: 16.sp,
                color: AppColor.dullerBlack,
              ),
              SizedBox(
                height: 10.h,
              ),
              NormalText(
                text: 'Author',
                fontWeight: FontWeight.bold,
                size: 16.sp,
              ),
              SizedBox(
                height: 10.h,
              ),
              NormalText(
                text: 'By Prof. Abass Akande',
                fontWeight: FontWeight.bold,
                size: 16.sp,
                color: AppColor.dullerBlack,
              ),
              SizedBox(
                height: 10.h,
              ),
              NormalText(
                text: 'Published Year',
                fontWeight: FontWeight.bold,
                size: 16.sp,
              ),
              SizedBox(
                height: 10.h,
              ),
              NormalText(
                text: 'December 2020',
                fontWeight: FontWeight.w500,
                size: 16.sp,
                color: AppColor.dullerBlack,
              ),
              SizedBox(
                height: 24.h,
              ),
              ReuseableButton(
                  text: 'Continue to read',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const MaterialScreen9(
                              title: 'BestBrain CHM',
                            )),
                      ),
                    );
                  })
            ],
          ),
        );
      },
    );
  }
}
