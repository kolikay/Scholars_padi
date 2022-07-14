import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/screens/material/reuseable_material_screen_results.dart';
import 'package:scholars_padi/widgets/reusesable_widget/new_reusable_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';

class ReuseableMaterialScreen extends StatelessWidget {
  const ReuseableMaterialScreen({Key? key}) : super(key: key);

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReuseableMaterialScreenResults(
                          appBarTitle: 'Other Materials',
                          cardMessage1: 'Faculty of Science',
                          cardMessage2: 'Faculty of Pharmacy',
                          cardMessage3: 'Faculty of Social Science',
                          cardMessage4: 'Faculty of Engineering',
                          cardMessage5: 'Faculty of Agriculture',
                          message: 'Select Your Faculty',
                          onPressed: () {},
                        ),
                      ));
                },
                child: Stack(
                  children: [
                    Container(
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
                    Positioned(
                      top: 70,
                      left: 50,
                      child: NormalText(
                        text: 'Class Materials',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        size: 30.sp,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              InkWell(
                onTap: () {},
                child: Stack(
                  children: [
                    Container(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
