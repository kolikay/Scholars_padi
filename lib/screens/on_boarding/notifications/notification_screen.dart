import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool select = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(103.h),
          child: ReuseableAppBar1(
            title: NormalText(
              text: 'Notifications',
              color: Colors.white,
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
          padding: EdgeInsets.all(24.0.h),
          child: Column(
            children: [
              MaterialCards(
                  selected: select,
                  cardMessage:
                      'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
                  cardDate: '18/08/2022',
                  cardTime: '11:05pm',
                  cardTitle: 'OAU management shutdown school'),
              SizedBox(
                height: 24.h,
              ),
              MaterialCards(
                  selected: select,
                  cardMessage:
                      'We welcome you into the largest educational platform on campus where students get access to all departments materials/textbooks and other necessary information. Explore through the App and get the best experience so far.Thank You.',
                  cardDate: '18/08/2022',
                  cardTime: '11:05pm',
                  cardTitle: 'Scholar’s Padi'),
              SizedBox(
                height: 24.h,
              ),
              MaterialCards(
                  selected: select,
                  cardMessage:
                      'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
                  cardDate: '18/08/2022',
                  cardTime: '11:05pm',
                  cardTitle: 'OAU management shutdown school'),
            ],
          ),
        ));
  }
}

class MaterialCards extends StatefulWidget {
  final String cardMessage;
  final String cardTitle;
  final String cardDate;
  final String cardTime;
  final Color? borderColor;
  bool selected;
  MaterialCards(
      {Key? key,
      required this.cardMessage,
      required this.cardDate,
      required this.cardTime,
      required this.cardTitle,
      required this.selected,
      this.borderColor})
      : super(key: key);

  @override
  State<MaterialCards> createState() => _MaterialCardsState();
}

class _MaterialCardsState extends State<MaterialCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 145.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.53.w),
        border: !widget.selected
            ? Border.all(color: Colors.black12)
            : Border.all(
                color: AppColor.mainColor,
                width: 2.0,
                style: BorderStyle.solid),
        color: const Color(0xffb580ff),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0.w),
        child: InkWell(
          onTap: () {
            setState(() {
              widget.selected = !widget.selected;
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 222.w,
                    height: 45.h,
                    child: NormalText(
                      text: widget.cardTitle,
                      size: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  NormalText(
                    text: widget.cardDate,
                    size: 12.sp,
                    color: AppColor.dullerBlack,
                  ),
                ],
              ),
              SizedBox(
                height: 58.h,
                width: 327.w,
                child: NormalText(
                  text: widget.cardMessage,
                  size: 12.sp,
                  color: AppColor.dullBlack,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100.w,
                  ),
                  NormalText(
                    text: widget.cardTime,
                    size: 11.sp,
                    color: AppColor.dullerBlack,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
