import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';

class NoteBookScreen1 extends StatelessWidget {
  const NoteBookScreen1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReuseableAppBar1(
          title: NormalText(
            text: 'NoteBook',
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
      body: Container(
        width: double.infinity,
        color: AppColor.darkContainer,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 120.h,
                  width: 120.h,
                  child: Icon(Icons.note_add_outlined, size: 120.h, color: AppColor.dullerBlack,),
                  
                ),
                SizedBox(height: 15.h,),
                NormalText(text: 'Make your life organized by recording daily notes', size: 14.sp, color: AppColor.dullBlack,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
