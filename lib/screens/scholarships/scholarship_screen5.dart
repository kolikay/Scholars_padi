import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_button.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class ScholarshipScreen5 extends StatefulWidget {
  const ScholarshipScreen5({
    Key? key,
  }) : super(key: key);

  @override
  State<ScholarshipScreen5> createState() => _ScholarshipScreen5State();
}

class _ScholarshipScreen5State extends State<ScholarshipScreen5> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(103.h),
          child: ReuseableAppBar1(
            title: NormalText(
              text: '2022 Batch A College.........',
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
          padding: EdgeInsets.only(left: 24.0.w, right: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Stack(
                children: [
                  Container(
                    height: 172.h,
                    width: 327.w,
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
                          isFav = !isFav;
                        });
                      },
                      icon: Icon(
                        !isFav ? Icons.favorite_outline_sharp : Icons.favorite,
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
              NormalText(
                text:
                    '2022 Batch A college Relief Fund Scholarship Application',
                size: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 10.h,
              ),
              NormalText(
                text: '2 Days ago',
                size: 12.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.dullerBlack,
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(
                color: AppColor.dullerBlack,
                thickness: 1.0,
              ),
              SizedBox(
                height: 10.h,
              ),
              NormalText(
                text:
                    'We are plessed to announce the Batch A College Relief Fund Scholarship Application for 2022',
                size: 13.sp,
                color: AppColor.dullBlack,
              ),
              SizedBox(
                height: 10.h,
              ),
              NormalText(
                text:
                    'Candidates will be acceesed on both performance  and need, and have satisfy the following conditions:',
                size: 13.sp,
                color: AppColor.dullBlack,
              ),
              SizedBox(
                height: 10.h,
              ),
              NormalText(
                  text: '1. Be a full-time 2nd year student in upper class.',
                  size: 13.sp,
                  color: AppColor.dullBlack),
              SizedBox(
                height: 10.h,
              ),
              NormalText(
                  text:
                      '2. Maintain at least a B - average or equivalent during the past years',
                  size: 13.sp,
                  color: AppColor.dullBlack),
              SizedBox(
                height: 10.h,
              ),
              NormalText(
                text:
                    '3. Demonstrate competence in English both spoken and written',
                size: 13.sp,
                color: AppColor.dullBlack,
              ),
              SizedBox(
                height: 24.h,
              ),
              ReuseableButton(text: 'Visit Website',backGroundColor: AppColor.dullerBlack, onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}

// top buttons
class CardButtons extends StatefulWidget {
  final String cardButtonMessage;
  final VoidCallback onPressed;
  final bool selected;

  const CardButtons({
    Key? key,
    required this.cardButtonMessage,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CardButtons> createState() => _CardButtonsState();
}

class _CardButtonsState extends State<CardButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0.h),
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: widget.selected ? AppColor.mainColor : Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black12),
          ),
          width: 150.w,
          child: Center(
            child: NormalText(
              text: widget.cardButtonMessage,
              size: 16.sp,
              color: widget.selected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
