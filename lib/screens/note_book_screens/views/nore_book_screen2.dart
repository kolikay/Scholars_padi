import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';

class NoteBookScreen2 extends StatefulWidget {
  const NoteBookScreen2({
    Key? key,
  }) : super(key: key);

  @override
  State<NoteBookScreen2> createState() => _NoteBookScreen2State();
}

class _NoteBookScreen2State extends State<NoteBookScreen2> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReuseableAppBar1(
          title: NormalText(
            text: 'No Title',
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
            icon: const Icon(Icons.save),
          ),
          thirdAppIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NormalText(
                text: 'March 27, 2022 08:00pm',
                color: AppColor.dullerBlack,
                size: 12.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 15.h,
              ),
              NormalText(
                text: 'Title',
                fontWeight: FontWeight.bold,
                size: 19.2.sp,
              ),
              SizedBox(
                height: 15.h,
              ),
              NormalText(
                text: 'Write something down',
                color: AppColor.dullerBlack,
                size: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
