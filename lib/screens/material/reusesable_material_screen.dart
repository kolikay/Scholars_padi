import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/new_reusable_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';

class ReusesableMaterialScreen extends StatelessWidget {
  const ReusesableMaterialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: NewReuseableAppBar(
          title: NormalText(
            text: 'Materials',
            color: Colors.white,
          ),
          firstAppIcon: IconButton(
            onPressed: () {},
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
        child: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            Stack(
              children: [
                InkWell(
                  onTap: (){},
                  child: Container(
                    width: 327.w,
                    height: 178.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.53.w),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('lib/assets/matImage1.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 50,
                    child: NormalText(
                  text: 'Class Materials',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  size: 30.sp,
                ))
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
          Stack(
              children: [
                InkWell(
                  onTap: (){},
                  child: Container(
                    width: 327.w,
                    height: 178.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.53.w),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('lib/assets/matImage2.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 50,
                    child: NormalText(
                  text: 'Other Materials',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  size: 30.sp,
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
