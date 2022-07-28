import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaterialScreen9 extends StatefulWidget {
  final String title;
  const MaterialScreen9({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<MaterialScreen9> createState() => _MaterialScreen9State();
}

class _MaterialScreen9State extends State<MaterialScreen9> {
  bool selected = false;
  String message = 'Theory';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(103.h),
          child: ReuseableAppBar1(
            title: NormalText(
              text: widget.title,
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
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  width: 310.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColor.mainColor),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selected = !selected;
                            message = 'Objective';
                          });
                        },
                        child: Container(
                          height: 50.h,
                          width: 152.w,
                          color: selected ? AppColor.mainColor : Colors.white,
                          child: Center(
                            child: NormalText(
                              text: 'Objective',
                              fontWeight: FontWeight.bold,
                              color: selected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selected = !selected;
                              message = 'Theory';
                            });
                          },
                          child: Container(
                            height: 50.h,
                            width: 152.w,
                            color: selected ? Colors.white : AppColor.mainColor,
                            child: Center(
                              child: NormalText(
                                text: 'Theory',
                                fontWeight: FontWeight.bold,
                                color: selected ? Colors.black : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                 MaterialCards(
                  cardMessage: 'CHM 101 $message',
                  cardDate: '2015',
                  cardColor:const Color(0xffF65B3C),
                ),
                SizedBox(
                  height: 15.h,
                ),
                MaterialCards(
                  cardMessage: 'CHM 101 $message',
                  cardDate: '2016',
                  cardColor: Colors.blue,
                ),
                SizedBox(
                  height: 15.h,
                ),
                 MaterialCards(
                  cardMessage: 'CHM 101 $message',
                  cardDate: '2017',
                  cardColor: Colors.red,
                ),
                SizedBox(
                  height: 15.h,
                ),
                 MaterialCards(
                  cardMessage: 'CHM 101 $message',
                  cardDate: '2018',
                  cardColor: Colors.green,
                ),
                SizedBox(
                  height: 15.h,
                ),
                MaterialCards(
                  cardMessage: 'CHM 101 $message',
                  cardDate: '2019',
                  cardColor:const Color(0xffFFC847),
                ),
              ]),
        ),
      ),
    );
  }
}

class MaterialCards extends StatelessWidget {
  const MaterialCards(
      {Key? key,
      required this.cardMessage,
      required this.cardDate,
      required this.cardColor})
      : super(key: key);

  final String cardMessage;
  final String cardDate;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black12)),
      child: Row(
        children: [
          Container(
            height: 50.h,
            width: 75,
            color: cardColor,
            child: Center(
              child: NormalText(
                text: cardDate,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                size: 18.sp,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0.w),
                child: NormalText(
                  text: cardMessage,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  size: 16.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
